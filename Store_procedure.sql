use sampledb;

DROP PROCEDURE IF Exists GetEmployeeDetails;

DELIMITER //

CREATE PROCEDURE GetEmployeeDetails(
    IN emp_id INT,
    OUT emp_name VARCHAR(255),
    OUT emp_salary DECIMAL(10, 2)
)
BEGIN
    -- Declare variables to store employee details
    DECLARE emp_name_var VARCHAR(255);
    DECLARE emp_salary_var DECIMAL(10, 2);
    
    -- Retrieve employee details based on emp_id
    SELECT name, salary INTO emp_name_var, emp_salary_var
    FROM employees
    WHERE id = emp_id;
    
    -- Assign values to output parameters
    SET emp_name = emp_name_var; 
    SET emp_salary = emp_salary_var;
END //

DELIMITER ;

call GetEmployeeDetails(1,@emp_name, @emp_salary);
select @emp_name, @emp_salary;