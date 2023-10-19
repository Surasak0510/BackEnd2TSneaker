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
    // res.header("Access-Control-Allow-Origin", "http://localhost:3000");
    res.header("Access-Control-Allow-Origin", "https://2tsneaker.vercel.app");
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
            "select email from members",
            (err, result, fields) => {
                result.forEach(e => {
                    if (e.email == req.body.Email) {
                        return res.status(400).json({ message: "have this email already"})
                    }
                });
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
            }
        )
    } catch (error) {
        console.log(err);
        return res.status(500).send();
    }

})

app.post('/login', async (req, res) => {
    const { Email, Password } = req.body;

    if (!Email || !Password) {
        return res.status(400).json({ message: "Email and Password are required" });
    }

    // ตรวจสอบรหัสผ่านที่เข้ารหัสเรียบร้อยแล้ว
    // และเชื่อมต่อฐานข้อมูลเพื่อตรวจสอบข้อมูลผู้ใช้
    try {
        // ตรวจสอบรหัสผ่านในฐานข้อมูล
        DB.query(
            "SELECT * FROM members WHERE Email = ?",
            [Email],
            (err, result, fields) => {
                if (err) {
                    console.error(err);
                    return res.status(500).send();
                }

                if (result.length === 0) {
                    return res.status(400).json({ message: "User not found" });
                }

                const user = result[0];

                // ตรวจสอบรหัสผ่าน
                // ในกรณีนี้คุณควรใช้การเข้ารหัสและตรวจสอบรหัสผ่านที่ถูกเข้ารหัส
                // เช่นโมดูล bcrypt
                if (user.Password === Password) {
                    return res.status(200).json({ message: "Login successful" });
                } else {
                    return res.status(400).json({ message: "Password incorrect" });
                }
            }
        );
    } catch (error) {
        console.log(err);
        return res.status(500).send();
    }
});


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

app.get('/read/single', async (req, res) => {
    const { Email } = req.body;
    try {
        DB.query(
            "select * from members where Email = ?",
            [Email],
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


// --------------------------------------------------------------------
//                          Product
// --------------------------------------------------------------------

app.post('/product', async (req, res) => {
    const { name , color , size , brand , types , amount , image , price} = req.body;

    try {
        DB.query(
            "insert into products (name , color , size , brand , types , amount , image , price) values(? , ? , ? , ? , ? , ? , ? , ?)",
            [name, color, size , brand , types , amount , image , price],
            (err, result , fields) => {
                if (err) {
                    console.log(err);
                    return res.status(400).send();
                }
                return res.status(201).json({ message: "New Product successfully created!"})
        })
    } catch (error) {
        console.log(error)
        return res.status(500).send();
    }
})

app.get('/product/all', async (req, res) => {
    try {
        DB.query(
            "select * from products",
            (err, result, fields) => {
                if (err) {
                    console.log(err);
                    return res.status(400).send();
                }
                return res.status(200).json(result);
            }
        )
    } catch (error) {
        console.log(error)
        return res.status(500).send();
    }
})

app.get('/product/:type', async (req, res) => {
    const type = req.params.type;
    try {
        DB.query(
            "select * from products where types = ?",
            [type],
            (err, result, fields) => {
                if (err) {
                    console.log(err);
                    return res.status(400).send();
                }
                return res.status(200).json(result);
            }
        )
    } catch (error) {
        console.log(error)
        return res.status(500).send();
    }
})

app.delete('/product/delete', async (req, res) => {
    const {id} = req.body;
    try {
        DB.query(
            "delete from products where Pro_id = ?",
            [id],
            (err, result, fields) => {
                if (err) {
                    console.log(err);
                    return res.status(400).send();
                }
                res.status(200).json({ message: "Delete successfully!"});
            }
            
        )
    } catch (error) {
        console.log(error)
        return res.status(500).send();
    }
})

app.patch('/product/update', async (req, res) => {
    const {id , amount} = req.body;
    try {
        DB.query(
            "update products set amount = ? where Pro_id = ?",
            [amount , id],
            (err , result, fields) => {
                if (err) {
                    console.log(err);
                    return res.status(400).send();
                }
                res.status(200).json({ message: "Update successfully!"});
            }
        )
    } catch (error) {
        console.log(error)
        return res.status(500).send();
    }
})

app.get('/product/size', async (req, res) => {
    const name = req.query.name;
    try {
        DB.query(
            "SELECT size FROM products WHERE name = ?",
            [name],
            (err, result, fields) => {
              if (err) {
                console.log(err);
                return res.status(400).send();
              }
              return res.status(200).json(result);
            }
          );          
    } catch (error) {
        console.log(error)
        return res.status(500).send();
    }
})


app.listen(port , () => {
    console.log('server listening on port '+port);
})
