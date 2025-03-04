SELECT *
FROM parks_and_recreation.employee_demographics;

SELECT 
first_name,
last_name,
age
FROM parks_and_recreation.employee_demographics;



SELECT 
first_name,
last_name,
age,
(age+10)*10,
birth_date
FROM parks_and_recreation.employee_demographics;

SELECT DISTINCT 
first_name,
age,
gender
FROM parks_and_recreation.employee_demographics;

SELECT distinct
first_name,
last_name,
salary
FROM parks_and_recreation.employee_salary
;