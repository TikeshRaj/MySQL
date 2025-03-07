-- UNION: Combines results from multiple queries but ensures unique values (default is UNION DISTINCT).

-- This query selects age and gender from employee_demographics.
-- However, first_name and last_name do not match in data type with age and gender, which would cause an error.
-- Instead, we can select similar columns from both tables.

SELECT age, gender  
FROM employee_demographics  

UNION  -- By default, UNION applies DISTINCT to remove duplicates  

SELECT age, gender  
FROM employee_salary;  

-- UNION: Categorizing employees into different labels based on age, gender, and salary.  

SELECT first_name, last_name, 'Old Man' AS Label  
FROM employee_demographics  
WHERE age > 40 AND gender = 'Male'  

UNION  

SELECT first_name, last_name, 'Old Lady' AS Label  
FROM employee_demographics  
WHERE age > 40 AND gender = 'Female'  

UNION  

SELECT first_name, last_name, 'Highly Paid Employee' AS Label  
FROM employee_salary  
WHERE salary > 70000  

ORDER BY first_name, last_name;  
