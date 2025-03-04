-- HAVING VS GROUP BY
SELECT *
FROM employee_demographics;


SELECT gender ,AVG(age)
FROM employee_demographics
GROUP BY gender 
HAVING AVG(age) <=40
;

SELECT occupation ,AVG(salary)
FROM employee_salary
WHERE occupation LIKE '%Manager%'
group by occupation
HAVING AVG(salary) > 75000
;