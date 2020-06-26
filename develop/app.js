// DEPENDENCIES

const inquirer = require("inquirer");
const connection = require("./connection"); 
const DB = require("./lib/db");

runSearch();

function runSearch() {
    inquirer
        .prompt({
            name: "action",
            type: "list",
            message: "WELCOME TO EMPLOYEE TRACKER. PLEASE CHOOSE FROM THE FOLLOWING:",
            choices: [
                "VIEW ALL EMPLOYEES",
                "VIEW ALL EMPLOYEES BY DEPARTMENT",
                "VIEW ALL EMPLOYEES BY MANAGER",
                "ADD EMPLOYEE",
                "REMOVE EMPLOYEE",
                "UPDATE EMPLOYEE ROLE",
                "UPDATE EMPLOYEE MANAGER",
                "EXIT APP"
            ]
        })
        .then(function (answer) {
            switch (answer.action) {
                case "VIEW ALL EMPLOYEES":
                    allEmployee();
                    break;

                case "VIEW ALL EMPLOYEES BY DEPARTMENT":
                    empDepartment();
                    break;

                case "VIEW ALL EMPLOYEES BY MANAGER":
                    empManager();
                    break;

                case "ADD EMPLOYEE":
                    empAdd();
                    break;

                case "REMOVE EMPLOYEE":
                    addRemove();
                    break;

                case "UPDATE EMPLOYEE ROLE":
                    updateRole();
                    break;

                case "UPDATE EMPLOYEE MANAGER":
                    updateManager();
                    break;

                case "EXIT APP":
                    connection.end();
                    break;
            }
        });
}

async function allEmployee() {
    const employees = await DB.findAllEmployee();
    console.log("Viewing all employees...\n");
    console.table(employees);
    // ASK INITIAL INQUIRE PROMPTS
    runSearch();
}

async function empDepartment() {
    const deptArray = await connection.query("SELECT department_name FROM department"); 
    console.log(JSON.parse(deptArray)); 

//     inquirer
//         .prompt({
//             name: "empDept",
//             type: "input",
//             message: "What department would you like to filter by? ",
//             choices:
//                 [
//                     "Management",
//                     "Engineering",
//                     "Technical Support",
//                     "Customer Support",
//                 ]

//             // Check to make sure user entered a numeric answer, not including alpha characters
//             validate: answer => {
//                 const pass = answer.match(
//                     /^[1-9]\d*$/
//                 );
//                 if (pass) {
//                     return true;
//                 }
//                 return "You entered alpha characters. Please enter an ID#, containing only numeric characters";
//             }
//         })
//         .then(function (answer) {
//             const employees = await DB.findAllDept();



//         }
//     const sqlQuery = "SELECT employee.first_name, employee.last_name, department.department_name, role_info.title, role_info.salary, employee.manager_id FROM employee RIGHT JOIN (role_info RIGHT JOIN department ON department.id = role_info.department_id) ON employee.role_id = role_info.department_id WHERE department.id = 1";
// }


function empAdd() {
    console.log("You are adding an employee...\n");
    inquirer
        .prompt({
            name: "empFirst",
            type: "input",
            message: "What is the employee's first name?"
        })
    var query = connection.query(
        "INSERT INTO employee SET ?",
        {
            flavor: "Rocky Road",
            price: 3.0,
            quantity: 50
        },
        function (err, res) {
            if (err) throw err;
            console.log(res.affectedRows + " product inserted!\n");
            // Call updateProduct AFTER the INSERT completes
            updateProduct();
        }
    );

    // logs the actual query being run
    console.log(query.sql);
}


}
