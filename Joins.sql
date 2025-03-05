-- INNER JOINS  
-- Retrieves all records from employee_demographics and employee_salary tables separately.  

SELECT *  
FROM employee_demographics;  

SELECT *  
FROM employee_salary;  

-- Performs an INNER JOIN between employee_demographics and employee_salary using employee_id.
-- This returns only the records where there is a match in both tables.

SELECT *  
FROM employee_demographics AS dem  
INNER JOIN employee_salary AS sal  
    ON dem.employee_id = sal.employee_id;  


-- OUTER JOINS  
-- LEFT JOIN: Returns all records from employee_demographics and only matching records from employee_salary.  
-- If there is no match, NULL values will appear for employee_salary fields.

SELECT *  
FROM employee_demographics AS dem  
LEFT JOIN employee_salary AS sal  
    ON dem.employee_id = sal.employee_id;  

-- RIGHT JOIN: Returns all records from employee_salary and only matching records from employee_demographics.  
-- If there is no match, NULL values will appear for employee_demographics fields.

SELECT *  
FROM employee_demographics AS dem  
RIGHT JOIN employee_salary AS sal  
    ON dem.employee_id = sal.employee_id;  


-- SELF JOIN  
-- This self-join compares two instances of the same table (employee_salary).
-- It finds employees whose employee_id is exactly 1 number apart from another employee (e.g., 101 & 102).
-- This might be used to pair employees in a sequential manner.

SELECT emp1.employee_id AS emp_santa1,  
emp1.first_name AS first_name_santa,  
emp1.last_name AS last_name_santa,  
emp2.employee_id AS emp_santa2,  
emp2.first_name AS first_name,  
emp2.last_name AS last_name  
FROM employee_salary AS emp1  
JOIN employee_salary AS emp2  
    ON emp1.employee_id + 1 = emp2.employee_id;  


-- JOINING MULTIPLE TABLES TOGETHER  
-- Retrieves all records from the parks_departments table.

SELECT *  
FROM parks_departments;  

-- Joins employee_demographics, employee_salary, and parks_departments together.
-- First, an INNER JOIN between employee_demographics and employee_salary is performed on employee_id.
-- Then, another INNER JOIN links employee_salary to parks_departments based on dept_id.

SELECT *  
FROM employee_demographics AS dem  
INNER JOIN employee_salary AS sal  
    ON dem.employee_id = sal.employee_id  
INNER JOIN parks_departments AS pd  
    ON sal.dept_id = pd.department_id;  
