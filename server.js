const express = require('express')
const dotenv = require('dotenv')
dotenv.config();

const app = express();
const port = 3000;
app.use(express.json());

const mysql = require('mysql')

// mysql connection
const DB = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_DATABASE,
})

DB.connect((err) => {
    if (err) {
        console.log('Error connecting to sqlite database')
        return;
    }
    console.log('Connecting to sql database');
})

app.use((req, res, next) => {
    res.header("Access-Control-Allow-Origin", process.env.ORIGIN);
    res.header("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, PATCH");
    res.header("Access-Control-Allow-Headers", "Content-Type, Authorization");
    next();
  });  


// ------------------------------------------------------------------------------------------------
//                                            Login / Register
// ------------------------------------------------------------------------------------------------
// create routes

app.post('/register', async (req, res) => {
    const { Username , Password, Email, tel } = req.body;

    try {
        DB.query(
            "insert into members (username, password, email, tel) values(? , ?, ?, ?)",
            [Username , Password, Email, tel],
            (err, result, fields) => {
                if (err) {
                    console.log("Error while inserting a members into the database");
                    return res.status(400).send();
                }
                return res.status(201).json({ message: "New User successfully created!"})
            }
        )
    } catch (error) {
        console.log(err);
        return res.status(500).send();
    }
})

// read
app.get('/read', async (req, res) => {
    try {
        DB.query(
            "select * from members",
            (err, result, fields) => {
                if (err) {
                    console.log(err);
                    return res.status(400).send();
                }
                res.status(200).json(result);
            })
    } catch (error) {
        console.log(error)
        return res.status(500).send();
    }
})

app.get('/read/single/:id', async (req, res) => {
    const UserID = req.params.id;
    try {
        DB.query(
            "select * from members where UserID = ?",
            [UserID],
            (err, result, fields) => {
                if (err) {
                    console.log(err);
                    return res.status(400).send();
                }
                res.status(200).json(result);
            })
    } catch (error) {
        console.log(error)
        return res.status(500).send();
    }
})

// update data
app.patch("/update/:UserID", async (req, res) => {
    const UserID = req.params.UserID;
    const newPassword = req.body.password;
    try {
        DB.query(
            "update members set Password = ? where UserID = ?",
            [newPassword,UserID],
            (err, result, fields) => {
                if (err) {
                    console.log(err);
                    return res.status(400).send();
                }
                res.status(200).json({ message: "User Password updated successfully!"});
            })
    } catch (error) {
        console.log(error)
        return res.status(500).send();
    }
})

// delete
app.delete("/delete/:UserID", async (req, res) => {
    const UserID = req.params.UserID;

    try {
        DB.query(
            "delete from members where UserID = ? ",
            [UserID],
            (err, result, fields) => {
                if (err) {
                    console.log(err);
                    return res.status(400).send();
                }
                if (result.affectedRows === 0) {
                    return res.status(404).json({ message: "No User that UserID"});
                }
                res.status(200).json({ message: "Delete successfully!"});
            })
    } catch (error) {
        console.log(error)
        return res.status(500).send();
    }
})

app.listen(port , () => {
    console.log('server listening on port '+port);
})