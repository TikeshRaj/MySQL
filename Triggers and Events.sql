-- TRIGGERS  

-- Checking the existing data in employee_demographics and employee_salary tables  
SELECT *  
FROM employee_demographics;  

SELECT *  
FROM employee_salary;  

-- Creating a Trigger: employee_insert  
-- This trigger is executed AFTER an INSERT operation on the employee_salary table.  
-- It automatically inserts the new employee's details into the employee_demographics table.  

DELIMITER $$  
CREATE TRIGGER employee_insert  
    AFTER INSERT ON employee_salary  
    FOR EACH ROW   
BEGIN  
    -- Inserting the new employee’s details into employee_demographics  
    INSERT INTO employee_demographics(employee_id, first_name, last_name)  
    VALUES (NEW.employee_id, NEW.first_name, NEW.last_name);  
END $$  
DELIMITER ;  

-- Inserting a new employee record into employee_salary  
-- The trigger will automatically insert this employee's details into employee_demographics.  

INSERT INTO employee_salary(employee_id, first_name, last_name, occupation, salary, dept_id)  
VALUES (13, 'Tikesh', 'Raj', 'Data_Analyst', 92000, NULL);  


#######################################################################################  

-- EVENTS  

-- Checking the existing data in employee_demographics before setting up an event  
SELECT *  
FROM employee_demographics;  

-- Creating an Event: delet_retires1  
-- This event runs every 30 seconds and deletes records from employee_demographics  
-- where the age is 60 or above. This helps remove retired employees automatically.  

DELIMITER $$  
CREATE EVENT delet_retires1  
ON SCHEDULE EVERY 30 SECOND  
DO  
BEGIN  
    DELETE  
    FROM employee_demographics  
    WHERE age >= 60;  
END $$  
DELIMITER ;  

-- Checking if event scheduling is enabled in MySQL  
SHOW VARIABLES LIKE 'event%';  
