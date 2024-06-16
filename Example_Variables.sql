-- Concatenating strings:
PRINT '"The successful warrior is the average man, ' + 'with laser-like focus." -- Bruce Lee'

--ASCII code 13 can be used to indicate a hard return line break:
PRINT 'The greatest glory in living lies not in never falling, but in rising every time we fall.' + CHAR(13) + '-- Nelson Mandela'

-- ASCII code 9 can be used to indicate a tab indention:
PRINT CHAR(9) + 'The first line of a paragraph is normally indented.'


-- -------------------------------------------------------------------------------------------


-- Creating a variable to store an integer:
DECLARE @myVariable INT
-- And then assign it the value of 6:
SET @myVariable = 6

-- To test that it succeeded:
PRINT @myVariable


-- -------------------------------------------------------------------------------------------


DECLARE @variable1 INT, @variable2 INT
SET @variable1 = 3
SET @variable2 = 5

-- To use one of these integer variables as a string, use the built-in convert function, inside of which you need to specify how many variable characters are needed:
PRINT 'That can of kombucha costs ' + CONVERT(varchar(5), @variable1) + ' dollars.' + CHAR(13)

-- Here is an example displaying values both ways:
PRINT 'Variable 1 = ' + CONVERT(VARCHAR(5), @variable1) + CHAR(13) + 'Variable 2 = ' + CONVERT(VARCHAR(5), @variable2) + CHAR(13) + 'Adding them to each other results in... '
PRINT @variable1 + @variable2  
PRINT CHAR(13)


-- Introducing a control flow statement using If-Else:
IF @variable1 <= 3
	BEGIN
		PRINT 'Variable 1 is less than or equal to 3' + CHAR(13)
	END

ELSE
	BEGIN
		PRINT 'Variable 1 is neither equal to 3, nor is its value less than 3' + CHAR(13)
	END


-- Using the NOT operator:
IF @variable1 != 9
	BEGIN
		PRINT 'Variable 1 is NOT equal to 9' + CHAR(13)
	END
ELSE
	BEGIN
		PRINT 'Variable 1 has a value of 3' + CHAR(13)
	END


-- Using the AND operator with Else If statements
IF @variable2 < 2
	BEGIN
		PRINT 'Variable 2 is less than two' + CHAR(13)
	END
ELSE IF @variable2 >=2 AND @variable2 <= 4
	BEGIN
		PRINT 'Variable 2 equals either 2, 3, or 4' + CHAR(13)
	END
ELSE IF @variable2 >5 AND @variable2 <=10
	BEGIN
		PRINT 'Variable 2 is a number between 6 and 10' + CHAR(13)
	END
ELSE IF @variable2 = 5
	BEGIN
		PRINT 'Variable 2 equals 5! Huzzah!' + CHAR(13)
	END
ELSE
	PRINT 'Uh oh!  Variable 2 is a number larger than 10!' + CHAR(13)

