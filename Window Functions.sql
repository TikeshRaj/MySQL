-- WINDOW FUNCTIONS  

-- Using the AVG() function with OVER(PARTITION BY) to calculate the average salary for each gender.
-- The PARTITION BY clause ensures that the average is calculated separately for each gender.

SELECT gender, AVG(salary) OVER(PARTITION BY gender) AS avg_salary  
FROM employee_demographics AS dem  
JOIN employee_salary AS sal  
    ON dem.employee_id = sal.employee_id;  


-- Using ROW_NUMBER(), RANK(), and DENSE_RANK() window functions to assign rankings based on salary.  
-- The ranking is partitioned by gender and ordered by salary in descending order.  

SELECT dem.first_name, dem.last_name, gender, salary,  

-- ROW_NUMBER() assigns a unique row number to each row within the partition (no duplicates).
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS Row_num,  

-- RANK() assigns a rank but allows gaps if salaries are the same.
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS Rank_num,  

-- DENSE_RANK() assigns a rank without gaps (i.e., no skipping of numbers for ties).
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS Dense_Rank_num  

FROM employee_demographics AS dem  
JOIN employee_salary AS sal  
    ON dem.employee_id = sal.employee_id;  
