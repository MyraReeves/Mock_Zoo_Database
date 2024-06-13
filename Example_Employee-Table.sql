

CREATE TABLE table_employees (
    Employee_id# INT PRIMARY KEY NOT NULL IDENTITY (10000, 1),
    First_Name VARCHAR(100) NOT NULL,
    Last_Name VARCHAR(100) NOT NULL,
    Contact_Phone VARCHAR(20) NOT NULL
);

INSERT INTO table_employees
    (First_Name, Last_Name, Contact_Phone)
    VALUES
    ('John', 'Smith', '555-345-5768'),
    ('Mary', 'White', '555-655-5203'),
    ('Jenny', 'Tutone', '555-867-5309'),
    ('Jeremy', 'Pi', '555-314-1592'),
    ('Constance', 'Euler', '555-577-2156'),
    ('Golden', 'Ratio', '555-161-8033')
;

-- To check that the table looks correct:
SELECT * FROM table_employees;



-- To show only the names of the first three employees on the list:
SELECT First_Name, Last_Name FROM table_employees WHERE Employee_id# BETWEEN 10000 AND 10002;

-- To show all 3 columns of the last two employees on the list:
SELECT First_Name, Last_Name, Contact_Phone FROM table_employees WHERE Employee_id# BETWEEN 10004 AND 10005;

-- To show all of the information for any employee whose last name begins with the letters "Eu":
SELECT First_Name, Last_Name, Contact_Phone FROM table_employees WHERE Last_Name LIKE 'Eu%';

-- To show all the information for any employee whose last name has the SECOND letter of "u":
SELECT First_Name, Last_Name, Contact_Phone FROM table_employees WHERE Last_Name LIKE '_u%';

-- -- To show all the information for any employee whose last name ENDS in the letter "e":
SELECT First_Name, Last_Name, Contact_Phone FROM table_employees WHERE Last_Name LIKE '_%e';
-- -------------------------------------------------------------------------------------------------

-- To change the value of the First Name column where the person's first name is John:
UPDATE table_employees SET First_Name = 'Matt' WHERE First_Name = 'John';

-- Check that the change took place:
SELECT * FROM table_employees;

-- Show all the information for any employee whose first name begins with M, and the last names are in alphabetical order (default):
SELECT First_Name, Last_Name, Contact_Phone FROM table_employees WHERE First_Name LIKE 'm%' ORDER BY Last_Name;

-- Or the M names in descending alphabetical order of last names:
SELECT First_Name, Last_Name, Contact_Phone FROM table_employees WHERE First_Name LIKE 'm%' ORDER BY Last_Name DESC;

-- ----------------------------------------------------------------------------------

-- Set up aliases to appear for the column names when showing the information, and order alphabetically by last name:
SELECT First_Name AS 'First name', Last_Name AS 'Last name', Contact_Phone AS 'Phone #' FROM table_employees ORDER BY Last_Name;

-- ----------------------------------------------------------------------------------

-- To delete a row from the table:
DELETE FROM table_employees WHERE Last_Name = 'White';

-- Check that the change took place:
SELECT * FROM table_employees ORDER BY Last_Name;

-- ----------------------------------------------------------------------------------

--  **WARNING!** To delete ENTIRE table!!!! **WARNING!**
DROP TABLE table_employees;
--  **WARNING!**   **WARNING!**  **WARNING!**  **WARNING!**