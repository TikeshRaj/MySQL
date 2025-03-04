# Where Cluse

SELECT *
FROM employee_salary;


SELECT *
FROM employee_salary
WHERE first_name = 'Tom'
;


SELECT *
FROM employee_salary
WHERE salary >= 50000
;

SELECT *
FROM employee_demographics
WHERE gender != 'Male'
;


SELECT *
FROM employee_demographics
WHERE age = 40
;

-- AND OR NOT -- LOGICAL OPERATORS

SELECT *
FROM employee_demographics
WHERE birth_date > 1985-01-01
AND gender = 'male' 
;

SELECT *
FROM employee_demographics
WHERE birth_date > 1985-01-01
AND NOT gender = 'male'
;


SELECT *
FROM employee_demographics
WHERE (first_name = 'leslie' AND age = 44) OR NOT age > 44
;

-- LIKE STATEMENT
-- % AND _ 

SELECT *
FROM employee_demographics
WHERE first_name LIKE 'A___'
;

SELECT *
FROM employee_demographics
WHERE first_name LIKE 'A%'
;