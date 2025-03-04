-- Using LIMIT to restrict the number of rows returned  

-- Selecting all columns from employee_demographics, ordering by age,  
-- and retrieving only 1 row, starting from the 4th row (since LIMIT uses zero-based indexing).  
SELECT *  
FROM employee_demographics  
ORDER BY age  
LIMIT 3, 1;  -- Skips the first 3 rows and returns the next one  

-- Aliasing (AS) to rename a column in the output  

-- Selecting gender and calculating the average age for each gender group  
-- Using an alias 'avg_age' for the computed average age  
-- Filtering groups where avg_age is greater than 30  
SELECT gender, AVG(age) AS avg_age  
FROM employee_demographics  
GROUP BY gender  
HAVING avg_age > 30;  
