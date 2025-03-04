-- Calculating the average age for each gender  
SELECT gender, AVG(age)  
FROM employee_demographics  
GROUP BY gender;  

-- Incorrect: WHERE cannot be used with aggregate functions like AVG()  
-- WHERE applies filtering before grouping, but AVG(age) is calculated after grouping,  
-- so this query will cause an error.  
SELECT gender, AVG(age)  
FROM employee_demographics  
WHERE AVG(age) > 40  -- This is not valid SQL  
GROUP BY gender;  

-- Correct: HAVING is used to filter aggregated results  
SELECT gender, AVG(age)  
FROM employee_demographics  
GROUP BY gender  
HAVING AVG(age) > 40;  -- Filters groups where the average age is greater than 40  

-- Using an alias for the computed AVG(age) and filtering using HAVING  
SELECT gender, AVG(age) AS AVG_age  
FROM employee_demographics  
GROUP BY gender  
HAVING AVG_age > 40;  -- Filters groups where the computed AVG_age is greater than 40  
