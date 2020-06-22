CREATE DATABASE employee_tracker; 

USE employee_tracker; 

CREATE TABLE department (
	id INTEGER NOT NULL AUTO_INCREMENT, 
    name VARCHAR(30) NOT NULL,
    PRIMARY KEY(id)
    ); 
    
CREATE TABLE role (
	id INTEGER NOT NULL AUTO_INCREMENT, 
    title VARCHAR(30) NOT NULL, 
    salary DECIMAL(10, 2) NOT NULL, 
    department_id INTEGER NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(deparment_id) REFERENCES department(id)
    ); 
    
CREATE TABLE employee (
	id INTEGER NOT NULL AUTO_INCREMENT, 
    first_name VARCHAR(30) NOT NULL, 
    last_name VARCHAR(30) NOT NULL, 
    role_id INT NOT NULL, 
    manager_id INT, 
    PRIMARY KEY(id),
    FOREIGN KEY(role_id) REFERENCES role(id)
    ); 

	

    

