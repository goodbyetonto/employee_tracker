// DEPENDENCIES 
const util = require("util"); 
const mysql = require("mysql"); 

const connection = mysql.createConnection({
    host: "localhost",

    // Your port; if not 3306
    port: 3306,

    // Your username
    user: "root",

    // Your password
    password: "ha7*sspANn5@@&5$",
    database: "employee_tracker"
});

//allows for promises connection queries
connection.query = util.promisify(connection.query);


module.exports = connection; 