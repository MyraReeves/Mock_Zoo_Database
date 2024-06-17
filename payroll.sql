CREATE DATABASE zoo_payroll;

USE zoo_payroll;



CREATE TABLE employees (
	employee_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	job_id INT NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	date_of_hire DATE
);

INSERT INTO employees VALUES
(5, 'Samuel', 'Smith', '2018-11-28'),
(1, 'Amanda', 'James', '2020-04-01'),
(4, 'Valerie', 'McGrath', '2021-12-11'),
(3, 'David', 'Tipsey', '2014-07-31'),
(2, 'Andrea', 'Antivilo', '2019-02-04');

SELECT * FROM employees;




CREATE TABLE job_title (
	job_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	job_title VARCHAR(50) NOT NULL,
	department VARCHAR(50) NOT NULL,
	salary_id INT NOT NULL
);

INSERT INTO job_title VALUES
('Veterinary Technician', 'Animal Health', 4),
('Office Clerk', 'Finance', 3),
('Digital Marketing Specialist', 'Marketing', 5),
('Animal Keeper (Part-time)', 'Animal Management', 4),
('Laborer', 'Grounds', 1);

SELECT * FROM job_title;




CREATE TABLE salary (
	salary_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	hourly_rate MONEY NOT NULL
);

INSERT INTO salary VALUES
(19.50),
(20.00),
(20.50),
(30.00),
(34.50);

SELECT * FROM salary;	




CREATE TABLE payroll (
	payroll_date DATE NOT NULL,
	employee_id INT NOT NULL,
	hours_worked INT NOT NULL
);

INSERT INTO payroll VALUES
('2024-06-17', 1, 25),
('2024-06-17', 2, 43),
('2024-06-17', 3, 22),
('2024-06-17', 4, 40),
('2024-06-17', 5, 38);



ALTER TABLE employees
ADD FOREIGN KEY (job_id) REFERENCES job_title(job_id);

ALTER TABLE payroll
ADD FOREIGN KEY (employee_id) REFERENCES employees(employee_id);

ALTER TABLE job_title
ADD FOREIGN KEY (salary_id) REFERENCES salary(salary_id);



SELECT * FROM employees
	INNER JOIN payroll ON employees.employee_id = payroll.employee_id
	INNER JOIN job_title ON employees.job_id = job_title.job_id
	INNER JOIN salary ON job_title.salary_id = salary.salary_id
;


SELECT 
	employees.first_name AS 'First Name:',
	employees.last_name AS 'Last Name:',
	payroll.hours_worked AS 'Hours Worked:',
	salary.hourly_rate AS 'Rate:',
	payroll.hours_worked * salary.hourly_rate AS 'Total Pay:'
	FROM employees
	INNER JOIN payroll ON employees.employee_id = payroll.employee_id
	INNER JOIN job_title ON employees.job_id = job_title.job_id
	INNER JOIN salary ON job_title.salary_id = salary.salary_id
;
