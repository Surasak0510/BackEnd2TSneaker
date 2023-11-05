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
    connectionLimit: 10,
    timeout: 60000,
})

DB.connect((err) => {
    if (err) {
        console.log('Error connecting to sqlite database')
        return;
    }
    console.log('Connecting to sql database');
})

app.use((req, res, next) => {
    res.header("Access-Control-Allow-Origin", "*");
    // res.header("Access-Control-Allow-Origin", "http://localhost:3000");
    // res.header("Access-Control-Allow-Origin", "https://2tsneaker.vercel.app");
    res.header("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, PATCH");
    res.header("Access-Control-Allow-Headers", "Content-Type, Authorization");
    next();
  });  


// ------------------------------------------------------------------------------------------------
//                                            Login / Register
// ------------------------------------------------------------------------------------------------
// create routes

app.post('/register', async (req, res) => {
    const { Username , Password, Email, tel  ,img} = req.body;

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
                    "insert into members (username, password, email, tel ,img) values(? , ?, ?, ?, ?)",
                    [Username , Password, Email, tel ,img],
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
            "SELECT * FROM members WHERE Email = ? and Password = ?",
            [Email , Password],
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
                    return res.status(200).json(user.UserID);
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
    const { UserID } = req.body;
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

app.get('/product/search', async (req, res) => {
    const { name } = req.body; // Use req.query to get query parameters
    try {
        DB.query(
            "SELECT * FROM products WHERE name LIKE ? LIMIT 1",
            [`%${name}%`], // Use placeholders to prevent SQL injection and add '%' around the search term
            (err, result, fields) => {
                if (err) {
                    console.log(err);
                    return res.status(400).send();
                }
                return res.status(200).json(result);
            }
        );
    } catch (error) {
        console.log(error);
        return res.status(500).send();
    }
});

app.get('/product/size', async (req, res) => {
    const name = req.body.name;
    try {
        DB.query(
            "select * from products where name = ? order by size desc",
            [name],
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


//----------------------------------------------------------------
//                          favorites
//----------------------------------------------------------------

app.get('/favorites/all', async (req, res) => {
    try {
        DB.query(
            "select * from favorites",
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

app.get('/favorites/all/User', async (req, res) => {
    const { UserID } = req.body;

    try {
        DB.query(
            "SELECT P.*, F.UserID FROM products P INNER JOIN favorites F ON P.Pro_id = F.Pro_id WHERE F.UserID = ?;",
            [UserID],
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

app.post('/product/favorites', async (req, res) => {
    const { UserID , Pro_id} = req.body;

    try {
        DB.query(
            "insert into favorites ( UserID , Pro_id) values(? , ? )",
            [UserID , Pro_id],
            (err, result, fields) => {
                if (err) {
                    console.log(err);
                    return res.status(400).send();
                }
                return res.status(201).json({ message: "Add new favorite successfully!"})
            }
        )
    } catch (error) {
        console.log(error)
        return res.status(500).send();
    }
})

app.delete('/product/dalete/favorites', async (req, res) => {
    const {fa_id} = req.body;

    try {
        DB.query(
            "delete from favorites where fa_id = ? ",
            [fa_id],
            (err, result, fields) => {
                if (err) {
                    console.log(err);
                    return res.status(400).send();
                }
                if (result.affectedRows === 0) {
                    return res.status(404).json({ message: "No favorite that fa_id"});
                }
                return res.status(201).json({ message: "Delete successfully!"})
            }
        )
    } catch (error) {
        console.log(error)
        return res.status(500).send();
    }
})

//----------------------------------------------------------------
//                             cart
//----------------------------------------------------------------

app.post('/cart', async (req, res) => {
    const { UserID, Pro_id, name, price, image, brand, color, amount, types, size } = req.body;

    try {
        
        DB.query(
            "INSERT INTO cart (Pro_id, UserID, name, price, image, brand, color, amount, types, size) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
            [Pro_id, UserID, name, price, image, brand, color, amount, types, size],
             (err, result, fields) => {
            if (err) {
                console.error(err);
                return res.status(400).json({ error: "Failed to add to cart" });
            }
            return res.status(201).json({ message: "Added to cart successfully!" });
        });
    } catch (error) {
        console.error(error);
        return res.status(500).json({ error: "Internal server error" });
    }
});


app.get('/cart/all',async (req, res) => {
    try {
        DB.query(
            "select * from cart ",
            (err, result, fields) => {
                if (err) {
                    console.log(err);
                    return res.status(400).send();
                }
                return res.status(200).json(result);
            }
        )
    } catch (error) {
        console.error(error);
        return res.status(500).json({ error: "Internal server error" });
    }
})

app.delete('/cart/delete', async (req, res) => {
    const {CartID} = req.body;

    try {
        DB.query(
            "delete from cart where CartID = ?",
            [CartID],
            (err, result, fields) => {
                if (err) {
                    console.error(err);
                    return res.status(400).json({ error: "Failed delete" });
                }
                return res.status(201).json({ message: "Delete successfully!" });
            }
        )
    } catch (error) {
        console.error(error);
        return res.status(500).json({ error: "Internal server error" });
    }
})

//----------------------------------------------------------------


app.listen(port , () => {
    console.log('server listening on port '+port);
})
