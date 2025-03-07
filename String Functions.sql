-- STRING FUNCTIONS  
-- Retrieves all records from the employee_demographics table for reference.  

SELECT *  
FROM employee_demographics;  


-- LENGTH FUNCTION  
-- Returns the number of characters in a string, including spaces.  

SELECT LENGTH('SKYFALL');  -- Returns 7  

-- Retrieves the length of each employee's first name.  
SELECT first_name, LENGTH(first_name)  
FROM employee_demographics;  

-- Retrieves the length of each employee's birth_date.  
SELECT birth_date, LENGTH(birth_date)  
FROM employee_demographics;  


-- TRIM FUNCTION  
-- Removes extra spaces from a string.  

SELECT TRIM('       SKY         ') AS Trim;  -- Removes spaces from both sides  

-- LEFT TRIM  
-- Removes spaces from the beginning (left side) of the string.  
SELECT LTRIM('       SKY         ') AS Trim;  

-- RIGHT TRIM  
-- Removes spaces from the end (right side) of the string.  
SELECT RTRIM('       SKY         ') AS Trim;  


-- SUBSTRING FUNCTION  
-- Extracts a portion of a string.  
-- Retrieves the birth month from the birth_date column (characters 6 & 7).  

SELECT birth_date, SUBSTRING(birth_date, 6, 2) AS Month  
FROM employee_demographics;  


-- REPLACE FUNCTION  
-- Replaces all occurrences of the letter 'A' with 'Z' in the first_name column.  

SELECT first_name, REPLACE(first_name, 'A', 'Z')  
FROM employee_demographics;  


-- LOCATE FUNCTION  
-- Finds the position of the first occurrence of 'A' in the first_name column.  
-- Orders results alphabetically by first name.  

SELECT first_name, LOCATE('A', first_name)  
FROM employee_demographics  
ORDER BY first_name;  

-- Finds the position of 'X' in the string 'ALEXNDER'.  
-- If the character is not found, LOCATE() returns 0.  
SELECT LOCATE('X', 'ALEXNDER');  -- Returns 3  


-- CONCAT FUNCTION  
-- Combines first_name and last_name into a full name with a space between them.  

SELECT first_name, last_name,  
CONCAT(first_name, ' ', last_name) AS Full_Name  
FROM employee_demographics;  
