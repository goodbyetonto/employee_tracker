const connection = require("../connection");

class DB {
    constructor(connection) {
        this.connection = connection;
    }

    findAllEmployee() {
        return this.connection.query(
            `
            SELECT employee.first_name, employee.last_name, role_info.title, department.department_name 
            AS department, role_info.salary, 
            CONCAT(manager.first_name, ' ', manager.last_name) 
            AS manager 
            FROM employee 
            LEFT JOIN role_info on employee.role_id = role_info.id 
            LEFT JOIN department on role_info.department_id = department.id 
            LEFT JOIN employee manager on manager.id = employee.manager_id
            `
        );
    };

    findAllDept() {
        `
        SELECT employee.first_name, employee.last_name, role_info.title, department.department_name 
        AS department, role_info.salary, 
        CONCAT(manager.first_name, ' ', manager.last_name) 
        AS manager 
        FROM employee 
        LEFT JOIN role_info on employee.role_id = role_info.id 
        LEFT JOIN department on role_info.department_id = department.id 
        LEFT JOIN employee manager on manager.id = employee.manager_id
        WHERE role_info.department_id = 
        `
    }

    findAllRoles() {
        return this.connection.query(
            `
            "SELECT role_info.id, role_info.title, department.department_name 
            AS department, role_info.salary 
            FROM role 
            LEFT JOIN department on role_info.department_id = department.id;"
            `
        );
    }


}

<<<<<<< HEAD
module.exports = new DB(connection);
=======
module.exports = new DB(connection);
>>>>>>> bfea559b86620f0794a6895e48839fcd98936cb0
