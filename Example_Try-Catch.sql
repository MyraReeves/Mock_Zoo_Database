/* --------------------------------------------------------------
	Example of a TRY/CATCH Block using built-in system functions:
-------------------------------------------------------------- */
BEGIN TRY
SELECT 1000/0 AS Result;	-- Attempting to divide a number by zero will result in an error
END TRY

BEGIN CATCH
SELECT
ERROR_NUMBER() AS [Error_Code],
ERROR_PROCEDURE() AS [Invalid_Procedure],
ERROR_MESSAGE() AS [Error_Details];
END CATCH





/* ----------------------------------------------------------------------------------
	Zoo database Example - 
	To display custom error message after accidental misspellings/etc during searches:
----------------------------------------------------------------------------------- */

USE database_zoo
GO

DECLARE @animalName VARCHAR(50)
DECLARE @errorString VARCHAR(300)
DECLARE @results VARCHAR(5)

SET @animalName = 'ja guar' -- This string will be modified to be whatever the user types in

SET @errorString = 'ERROR' + CHAR(13) + 'You searched for: ' + @animalName + CHAR(13) + 'I am sorry but I can not find that individual in the database. Please check your spelling and try again.' + CHAR(13) + 'NOTE: Searches should follow the format of: species common name - individual''s name'  + CHAR(13) + 'Example: brown bear - Dexter'
BEGIN TRY
	SET @results = (SELECT COUNT(animal_collection.animal) FROM animal_collection WHERE animal = @animalName)
	IF @results = 0
		BEGIN
			RAISERROR(@errorString, 16, 1)		-- RAISERROR is outdated. It should be THROW (with its associated syntax) instead
			RETURN				-- Blank because you are returning the @errorString
		END
	ELSE IF @results = 1
		BEGIN
			SELECT
				animals.animal, 
				z1.phylum,
				z2.class_type,
				z3.habitat_type AS 'location',
				z4.diet_type,
				z5.nutrition_type AS 'diet',
				z6.nutrition_type AS 'additional diet',
				z7.nutrition_type AS 'seasonal supplement',
				z8.care_type AS 'care needed'

				FROM animal_collection AS animals
				INNER JOIN table_animalia AS z1 ON z1.animalia_id = animals.phylum
				INNER JOIN table_class AS z2 ON z2.class_id = animals.taxonomy_class
				INNER JOIN habitat AS z3 ON z3.habitat_id = animals.habitat
				INNER JOIN table_diet_type AS z4 ON z4.diet_id = animals.diet_type
				INNER JOIN animal_diet AS z5 ON z5.nutrition_id = animals.commissary_id
				INNER JOIN animal_diet z6 ON z6.nutrition_id = animals.additional_commissary
				INNER JOIN animal_diet z7 ON z7.nutrition_id = animals.seasonal_diet_supplement
				INNER JOIN animal_care AS z8 ON z8.care_id = animals.care_needed
				WHERE animal = @animalName
			;
		END
END TRY

BEGIN CATCH
	SELECT @errorString = ERROR_MESSAGE()
	RAISERROR (@errorString, 10, 1)
END CATCH