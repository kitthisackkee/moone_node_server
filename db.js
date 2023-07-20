const mysql = require("mysql2")
const connection = mysql.createPool({
    connectionLimit: 10000,
    host:"mysql-136683-0.cloudclusters.net",
    user:"kee",
    password: "12345678",
    port: 18108,
    database:"moone_db"
})

module.exports = connection