-- CASE STATEMENTS  
-- This query retrieves employees' first name, last name, and age from the 'employee_demographics' table.
-- It categorizes employees into three age groups:
--   - 'Old' if age is greater than 50
--   - 'Young' if age is less than 30
--   - 'Middle_Age' if age is between 30 and 50

SELECT first_name, last_name, age,
CASE
    WHEN age > 50 THEN 'Old'
    WHEN age < 30 THEN 'Young'
    WHEN age BETWEEN 30 AND 50 THEN 'Middle_Age'
END AS Label
FROM employee_demographics;


-- SALARY INCREMENT & BONUS CALCULATION  
-- This query retrieves employees' first name, last name, and salary from the 'employee_salary' table.
-- It calculates the new salary based on the following conditions:
--   - If the salary is <= 50,000, it is increased by 5%
--   - If the salary is > 50,000, it is increased by 7%
-- It also calculates a bonus for employees in the Finance department (dept_id = 6), giving them a 10% bonus.
-- Employees in other departments (dept_id < 6) receive no bonus.

SELECT first_name, last_name, salary,
CASE
    WHEN salary <= 50000 THEN salary * 1.05
    WHEN salary > 50000 THEN salary * 1.07
END AS New_salary,
CASE
    WHEN dept_id = 6 THEN salary * 0.10  -- Finance department bonus (10% of salary)
    ELSE 0  -- No bonus for other departments
END AS Bonus
FROM employee_salary;


-- Retrieve all employee salary details
SELECT *
FROM employee_salary;
