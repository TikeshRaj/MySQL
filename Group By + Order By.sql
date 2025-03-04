-- GROUP BY: Aggregating data based on unique values  

-- Selecting distinct genders from employee_demographics  
SELECT gender  
FROM employee_demographics  
GROUP BY gender;  

-- Calculating aggregate functions (AVG, MAX, MIN, COUNT) for each gender group  
SELECT gender,  
       AVG(age) AS avg_age,   -- Calculates the average age per gender  
       MAX(age) AS max_age,   -- Finds the oldest person per gender  
       MIN(age) AS min_age,   -- Finds the youngest person per gender  
       COUNT(age) AS count_age -- Counts the number of records per gender  
FROM employee_demographics  
GROUP BY gender;  

-- Grouping by occupation and salary  
-- This will return distinct combinations of occupation and salary  
SELECT occupation, salary  
FROM employee_salary  
GROUP BY occupation, salary;  

-- ORDER BY: Sorting the results  

-- Selecting all columns from employee_demographics, ordered by gender first and then by age  
SELECT *  
FROM employee_demographics  
ORDER BY gender, age;  -- Sorts first by gender alphabetically, then by age in ascending order  

-- Selecting all columns from employee_salary, ordered by salary in ascending order (default)  
SELECT *  
FROM employee_salary  
ORDER BY salary;  
