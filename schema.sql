-- Drop DB if exists -- 
DROP DATABASE IF EXISTS employee_tracker; 

-- Create Database -- 
CREATE DATABASE employee_tracker; 

-- Access db 'employee_tracker' for all SQL commands below --
USE employee_tracker; 

-- Create Tables -- 
CREATE TABLE department (
	id INTEGER NOT NULL AUTO_INCREMENT, 
    department_name VARCHAR(30) NOT NULL,
    PRIMARY KEY(id)
    ); 
    
CREATE TABLE role_info (
	id INTEGER NOT NULL AUTO_INCREMENT, 
    title VARCHAR(30) NOT NULL, 
    salary DECIMAL(10, 2) NOT NULL, 
    department_id INTEGER NOT NULL,
    PRIMARY KEY(id)
    -- CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES department(id) ON DELETE CASCADE
    ); 
    
CREATE TABLE employee (
	id INTEGER NOT NULL AUTO_INCREMENT, 
    first_name VARCHAR(30) NOT NULL, 
    last_name VARCHAR(30) NOT NULL, 
    role_id INT NOT NULL, 
    manager_id INT, 
    PRIMARY KEY(id)
-- 	CONSTRAINT fk_manager FOREIGN KEY (manager_id) REFERENCES employee(id) ON DELETE SET NULL
    ); 

-- Create Seed Values for tables --     
INSERT INTO department (department_name) 
	VALUES ("Management"), ("Engineering"), ("Technical Support"), ("Customer Support"); 
    
INSERT INTO role_info (title, salary, department_id) 
	VALUES ("Manager", 90000.00, 1), ("Software Enginner", 75000.00, 2), ("Helpdesk Technician", 60000.00, 3), ("Customer Service Rep", 45000.00, 4); 
    
INSERT INTO employee (first_name, last_name, role_id, manager_id) 
	VALUES 
		("Garrett", "Trask", 1, null), 
		("Cassie", "Allinger", 4, 1), 
        ("Bodhi", "Allinger", 2, 6), 
        ("Debbie", "Bruins", 3, 6), 
        ("Jack", "White", 3, 1), 
		("Tonto", "Trask", 1, null), 
		("Barry", "Bruins", 4, 6), 
		("Po", "Po", 2, 6); 

-- Test to make sure tables are created with seed values -- 
SELECT * FROM department; 
SELECT * FROM role_info; 
SELECT * FROM employee; 

-- Join Statements -- 

-- Inner Join of 'department' and 'role_info' to output the department of a particular role -- 
SELECT department.department_name FROM department INNER JOIN role_info ON (department.id = role_info.department_id); 

SELECT employee.first_name, employee.last_name, role_info.title FROM employee RIGHT JOIN role_info ON (employee.role_id = role_info.id); 


-- SELECT employee.first_name, employee.last_name, department.department_name, role_info.title, role_info.salary, employee.manager_id
-- FROM employee  
-- RIGHT JOIN (role_info RIGHT JOIN department 
-- ON department.id = role_info.department_id) 
-- ON employee.role_id = role_info.department_id
-- RIGHT JOIN ON employee.manager_id ON manager.id = employee.manager_id 





SELECT employee.first_name, employee.last_name, role_info.title, department.department_name AS department, role_info.salary, 
CONCAT(manager.first_name, ' ', manager.last_name) 
AS manager FROM employee 
LEFT JOIN role_info on employee.role_id = role_info.id 
LEFT JOIN department on role_info.department_id = department.id 
LEFT JOIN employee manager on manager.id = employee.manager_id;









	

    

