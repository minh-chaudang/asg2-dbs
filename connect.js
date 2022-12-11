var sql = require('mssql/msnodesqlv8')

var config = {
    server: "DESKTOP-AG1IOKV",
    user: "chocomint",
    password: "220802",
    database: "EnglishCenter",
    driver: "msnodesqlv8"
};

const conn = new sql.ConnectionPool(config).connect().then(
    pool => {return pool;}
)

module.exports = 
{
    conn: conn,
    sql: sql
}