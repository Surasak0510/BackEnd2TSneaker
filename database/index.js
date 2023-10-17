const mysql = require('mysql')

// mysql connection
const DB = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: '2tsneaker',
})

DB.connect((err) => {
    if (err) {
        console.log('Error connecting to sqlite database')
        return;
    }
    console.log('Connecting to sql database');
})

module.exports = DB;