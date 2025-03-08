-- Using Temporary Tables in MySQL  

-- Creating a Temporary Table: temp_table  
-- This table stores first name, last name, and favorite movie of a person.  
-- Temporary tables exist only for the duration of a session and are automatically dropped  
-- when the session ends.  

CREATE TEMPORARY TABLE temp_table  
(  
    first_name VARCHAR(50),  
    last_name VARCHAR(50),  
    fevourite_movie VARCHAR(100)  
);  

-- Retrieving all data from the temporary table  
SELECT *  
FROM temp_table;  

-- Inserting a sample record into the temporary table  
INSERT INTO temp_table  
VALUES ('Tikesh', 'Raj', 'Top Gun: Maverick');  

-- Creating a Temporary Table from an Existing Table  
-- Extracting data from the employee_salary table where salary is above 50,000  
-- and storing it in a temporary table called salary_above_50k.  

-- Checking the existing data in employee_salary table  
SELECT *  
FROM employee_salary;  

-- Creating the temporary table salary_above_50k  
-- This table will hold employee records where the salary is 50,000 or more.  

CREATE TEMPORARY TABLE salary_above_50k  
(  
    SELECT *  
    FROM employee_salary  
    WHERE salary >= 50000  
);  

-- Retrieving data from the temporary table and sorting by salary in ascending order  
SELECT *  
FROM salary_above_50k  
ORDER BY salary;  
