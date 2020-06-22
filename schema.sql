CREATE DATABASE employee_tracker; 

USE employee_tracker; 

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
    PRIMARY KEY(id),
    FOREIGN KEY(id) REFERENCES department(id)
    ); 
    
CREATE TABLE employee (
	id INTEGER NOT NULL AUTO_INCREMENT, 
    first_name VARCHAR(30) NOT NULL, 
    last_name VARCHAR(30) NOT NULL, 
    role_id INT NOT NULL, 
    manager_id INT, 
    PRIMARY KEY(id),
    FOREIGN KEY(id) REFERENCES role_info(id)
    ); 
    
INSERT INTO department (department_name) VALUES ("Engineering"), ("Customer Service"), ("Technical Support"), ("Management"); 
INSERT INTO role_info (title, salary, department_id) VALUES ("Manager", 90000.00, 4), ("Software Enginner", 75000.00, 1), ("Helpdesk Technician", 60000.00, 3), ("Customer Service Rep", 45000.00, 2); 
INSERT INTO employee (first_name, last_name, role_id, manager_id) VALUES ("Garrett", "Trask", 1, 3), ("Cassie", "Allinger", 4, 2), ("Bodhi", "Allinger", 2, 2), ("Debbie", "Bruins", 3, 2); 

SELECT * FROM department; 
SELECT * FROM role_info; 
SELECT * FROM employee; 





	

    

