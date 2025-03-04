-- Selecting all columns from the employee_salary table  
SELECT *  
FROM employee_salary;  

-- Selecting all columns from employee_salary where first_name is 'Tom'  
SELECT *  
FROM employee_salary  
WHERE first_name = 'Tom';  

-- Selecting all employees with a salary of 50,000 or more  
SELECT *  
FROM employee_salary  
WHERE salary >= 50000;  

-- Selecting all employees who are not male  
SELECT *  
FROM employee_demographics  
WHERE gender != 'Male';  

-- Selecting all employees who are exactly 40 years old  
SELECT *  
FROM employee_demographics  
WHERE age = 40;  

-- Using logical operators (AND, OR, NOT)  

-- Selecting employees born after January 1, 1985, and who are male  
SELECT *  
FROM employee_demographics  
WHERE birth_date > '1985-01-01'  
AND gender = 'male';  

-- Selecting employees born after January 1, 1985, but NOT male  
SELECT *  
FROM employee_demographics  
WHERE birth_date > '1985-01-01'  
AND NOT gender = 'male';  

-- Selecting employees where first_name is 'Leslie' AND age is 44, OR employees whose age is NOT greater than 44  
SELECT *  
FROM employee_demographics  
WHERE (first_name = 'Leslie' AND age = 44) OR NOT age > 44;  

-- LIKE statement for pattern matching  

-- Selecting employees whose first name starts with 'A' and has exactly four characters  
SELECT *  
FROM employee_demographics  
WHERE first_name LIKE 'A___';  -- Example matches: 'Alex', 'Anne', etc.  

-- Selecting employees whose first name starts with 'A' and has any number of characters after  
SELECT *  
FROM employee_demographics  
WHERE first_name LIKE 'A%';  -- Example matches: 'Adam', 'Amanda', 'Alexandra', etc.  
