-- Selecting all columns from the employee_demographics table
SELECT *  
FROM parks_and_recreation.employee_demographics;  

-- Selecting specific columns (first_name, last_name, and age) from the employee_demographics table
SELECT  
    first_name,  
    last_name,  
    age  
FROM parks_and_recreation.employee_demographics;  

-- Selecting specific columns along with an expression that modifies the age and includes birth_date  
SELECT  
    first_name,  
    last_name,  
    age,  
    (age + 10) * 10 AS adjusted_age,  -- Adding 10 to age, then multiplying by 10  
    birth_date  
FROM parks_and_recreation.employee_demographics;  

-- Selecting distinct values of first_name, age, and gender to remove duplicate entries  
SELECT DISTINCT  
    first_name,  
    age,  
    gender  
FROM parks_and_recreation.employee_demographics;  

-- Selecting distinct employee names and salary from the employee_salary table  
SELECT DISTINCT  
    first_name,  
    last_name,  
    salary  
FROM parks_and_recreation.employee_salary;  
