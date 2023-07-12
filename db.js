const mysql = require("mysql2")
const connection = mysql.createPool({
    connectionLimit: 10000,
    host:"localhost",
    user:"root",
    password: "",
    port: 3306,
    database:"moone_db"
})

module.exports = connection