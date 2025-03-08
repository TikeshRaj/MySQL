-- Creating and Calling Stored Procedures in MySQL  

-- First Stored Procedure: large_salaries()  
-- Retrieves all employee salary records where the salary is greater than or equal to 50,000.  

CREATE PROCEDURE large_salaries()  
SELECT *  
FROM employee_salary  
WHERE salary >= 50000;  

-- Calling the stored procedure  
CALL large_salaries();  

-- Second Stored Procedure: small_salaries()  
-- Retrieves all employee salary records where the salary is less than 50,000.  

CREATE PROCEDURE small_salaries()  
SELECT *  
FROM employee_salary  
WHERE salary < 50000;  

-- Calling the stored procedure  
CALL small_salaries();  

-- Third Stored Procedure: new_salary1()  
-- Uses a DELIMITER to handle multiple SQL statements within the procedure.  
-- Retrieves and orders employees with salaries >= 50,000, followed by those with salaries < 50,000.  

DELIMITER $$  
CREATE PROCEDURE new_salary1()  
BEGIN  
    -- Retrieve salaries greater than or equal to 50,000, sorted in ascending order  
    SELECT *  
    FROM employee_salary  
    WHERE salary >= 50000  
    ORDER BY salary;  

    -- Retrieve salaries less than 50,000  
    SELECT *  
    FROM employee_salary  
    WHERE salary < 50000;  
END $$  
DELIMITER ;  

-- Calling the stored procedure  
CALL new_salary1();  

-- Fourth Stored Procedure: new_sal(P_employee_id)  
-- Accepts an employee_id as an input parameter and returns the salary for that employee.  

DELIMITER $$  
CREATE PROCEDURE new_sal(P_employee_id INT)  
BEGIN  
    -- Retrieve salary for the given employee_id  
    SELECT salary  
    FROM employee_salary  
    WHERE employee_id = P_employee_id;  
END $$  
DELIMITER ;  

-- Calling the stored procedure with employee_id = 1  
CALL new_sal(1);  
