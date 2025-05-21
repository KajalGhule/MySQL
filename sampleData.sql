create database sampledb;

use sampledb;

CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    position VARCHAR(50),
    salary DECIMAL(10, 2)
);

INSERT INTO employees (name, position, salary) VALUES ('Alice Smith', 'Engineer', 75000.00);
SELECT * FROM employees;
UPDATE employees SET salary = 78000.00 WHERE name = 'Alice Smith';
UPDATE employees SET name = 'kajal ghule' WHERE id = 1;


CREATE INDEX idx_salary ON employees(salary);

DELIMITER //
CREATE PROCEDURE GetUserByID(IN userID INT)
BEGIN
    SELECT * FROM employees WHERE id = userID;
END //
DELIMITER ;

call GetUserByID(1);


DELIMITER //
CREATE PROCEDURE InsertEmp(IN name VARCHAR(100), IN position VARCHAR(50), IN salary DECIMAL(10, 2))
BEGIN
    INSERT INTO employees (name, position, salary) VALUES (name, position, salary);
END //
DELIMITER ;

call InsertEmp('kiran', 'CA',45200000);

DELIMITER //
CREATE TRIGGER after_emp_insert
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
    INSERT INTO log (action, user_id, action_date) VALUES ('INSERT', NEW.id, NOW());
END //
DELIMITER ;

CREATE TABLE log (
    id INT AUTO_INCREMENT PRIMARY KEY,
    action VARCHAR(50),
    user_id INT,
    action_date DATETIME
);

