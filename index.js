const express = require("express");
var bodyParser = require('body-parser');
const PORT = process.env.PORT || 3001;
const app = express();
const {conn, sql} = require('./connect')
app.use(bodyParser.urlencoded({
    extended:true
}));

app.get('/', function(req, res){
    res.send("Hello from Home")
})
/*
app.get('/person', async function(req, res){
    var pool = await conn
    var sqlString = 'SELECT * FROM Person'
    return await pool.request().query(sqlString, function(err, data){
        console.log(err, data)
    })

})
*/

app.get("/user", async (req, res) => {
    // var pool = await conn;
    /*
    var sqlString = "select * from person";
    await pool.request().query(sqlString, function(err, data){
        if(err) console.log(err);
        console.log(data.recordset);
        res.json(data.recordset);
    });*/
});


app.listen(3000)
