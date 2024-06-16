
-- To Encapsulate the process of showing all info for one individual animal:
CREATE  PROC getAnimalInfo      -- PROC is an accepted abbreviation for PROCEDURE

-- Set up a variable so that the user can type whichever desired animal they wish to search for:
@desiredAnimalName VARCHAR(80)

AS

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
		WHERE animal = @desiredAnimalName
	;

END