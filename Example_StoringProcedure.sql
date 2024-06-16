-- To store a procedure, create a database where you would like to store it:
CREATE DATABASE stored_database
GO

-- Make sure to tell the program to look at that newly created database for what is to follow:
USE stored_database

-- Then name the procedure and begin it
CREATE PROCEDURE createZooDatabase
AS
BEGIN
-- [Insert all tables and queries here (for example, the contents of the SQLQuery.sql file) ]
END

-- --------------------------------------------------------------------------------------------

-- To then use that stored procedure, first make sure the program is looking in the correct location:
USE stored_database

-- Then execute the procedure
EXECUTE [dbo].[createZooDatabase]
