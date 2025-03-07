-- SUBQUERY: Retrieving employee details for those who belong to department 1  
-- The subquery inside the WHERE clause retrieves employee IDs from employee_salary  
-- where dept_id = 1, and the outer query fetches their details from employee_demographics  

SELECT *  
FROM employee_demographics  
WHERE employee_id IN  
    (SELECT employee_id  
     FROM employee_salary  
     WHERE dept_id = 1);  


-- SUBQUERY: Finding the average of the maximum age values for each gender  
-- The inner query calculates average age, max age, min age, and count of employees per gender  
-- The outer query then takes the average of all max_age values from the inner result  

SELECT AVG(max_age)  
FROM  
    (SELECT gender,  
            AVG(age) AS avg_age,  
            MAX(age) AS max_age,  
            MIN(age) AS min_age,  
            COUNT(age) AS count_age  
     FROM employee_demographics  
     GROUP BY gender) AS gender_stats;  
