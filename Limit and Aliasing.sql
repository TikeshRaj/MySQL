-- LIMIT

SELECT *
FROM employee_demographics
ORDER BY age 
LIMIT 3, 1
;

-- ALIASING (AS)

SELECT gender, AVG(age) AS avg_age
FROM employee_demographics
GROUP BY gender
HAVING avg_age > 30
;