-- Using Common Table Expressions (CTEs) to simplify complex queries  
--  
-- First Query:  
-- Creates a CTE named CTE_Example to calculate average, maximum, minimum, and count of salaries  
-- grouped by gender. Then, it calculates the overall average of these gender-based averages.  

WITH CTE_Example AS  
(  
    SELECT gender,  
           AVG(salary) AS avg_sal,  
           MAX(salary) AS max_sal,  
           MIN(salary) AS min_sal,  
           COUNT(salary) AS count_sal  
    FROM employee_demographics AS dem  
    JOIN employee_salary AS sal  
        ON dem.employee_id = sal.employee_id  
    GROUP BY gender  
)  
SELECT AVG(avg_sal)  
FROM CTE_Example;  

-- Second Query:  
-- Similar to the first query but uses a subquery instead of a CTE to achieve the same result.  
-- It calculates the average salary per gender and then finds the overall average.  

SELECT AVG(avg_sal)  
FROM (  
    SELECT gender,  
           AVG(salary) AS avg_sal,  
           MAX(salary) AS max_sal,  
           MIN(salary) AS min_sal,  
           COUNT(salary) AS count_sal  
    FROM employee_demographics AS dem  
    JOIN employee_salary AS sal  
        ON dem.employee_id = sal.employee_id  
    GROUP BY gender  
) AS CTE_example;  

-- Third Query:  
-- Uses two CTEs:  
-- CTE_Example retrieves employee_id, gender, and birth_date for employees born after 1980.  
-- CTE_Example_2 retrieves employee_id and salary for employees earning more than 50,000.  
-- The final SELECT statement joins these two CTEs on employee_id to filter employees who  
-- meet both conditions.  

WITH CTE_Example AS  
(  
    SELECT employee_id, gender, birth_date  
    FROM employee_demographics AS dem  
    WHERE birth_date > '1980-01-01'  
),  
CTE_Example_2 AS  
(  
    SELECT employee_id, salary  
    FROM employee_salary AS sal  
    WHERE salary > 50000  
)  
SELECT *  
FROM CTE_Example  
JOIN CTE_Example_2  
    ON CTE_Example.employee_id = CTE_Example_2.employee_id;  
