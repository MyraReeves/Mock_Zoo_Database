PRINT '"The successful warrior is the average man, ' + 'with laser-like focus." -- Bruce Lee'

-- Creating a variable to store an integer:
DECLARE @myVariable INT
-- And then assign it the value of 6:
SET @myVariable = 6

-- To test that it succeeded:
PRINT @myVariable


DECLARE @variable1 INT, @variable2 INT
SET @variable1 = 3
SET @variable2 = 5

-- To use one of these integer variables as a string, use the built-in convert function, inside of which you need to specify how many variable characters are needed:
PRINT 'That can of kombucha costs ' + CONVERT(varchar(10), @variable1) + ' dollars.'