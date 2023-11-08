const express = require('express')
const dotenv = require('dotenv')
dotenv.config();
const bcrypt = require('bcrypt');

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

const { check, validationResult } = require('express-validator');

// ...rest of the code...

// Define validation middleware for registration
const registrationValidation = [
    check('Username').isLength({ min: 1 }).withMessage('Username is required'),
    check('Email').isEmail().withMessage('Invalid email'),
    check('Password').isLength({ min: 6 }).withMessage('Password must be at least 6 characters'),
    check('tel').isMobilePhone().withMessage('Invalid phone number'),
];

app.post('/register', registrationValidation, (req, res) => {
    const errors = validationResult(req);

    if (!errors.isEmpty()) {
        return res.status(400).json({ errors: errors.array() });
    }

    const { Username, Password, Email, tel } = req.body;

    // Hash the password before storing it
    bcrypt.hash(Password, 10, (hashErr, hash) => {
        if (hashErr) {
            console.error(hashErr);
            return res.status(500).json({ message: 'Error hashing password' });
        }

        // Check if the email already exists in the database
        DB.query('SELECT email FROM members WHERE email = ?', [Email], (err, result) => {
            if (err) {
                console.error(err);
                return res.status(500).json({ message: 'Database error' });
            }

            if (result.length > 0) {
                return res.status(400).json({ message: 'Email already exists' });
            }

            // Insert the user into the database
            DB.query(
                'INSERT INTO members (username, password, email, tel) VALUES (?, ?, ?, ?)',
                [Username, hash, Email, tel],
                (insertErr) => {
                    if (insertErr) {
                        console.error(insertErr);
                        return res.status(500).json({ message: 'Error creating user' });
                    }
                    return res.status(201).json({ message: 'User created successfully' });
                }
            );
        });
    });
});

app.post('/login', async (req, res) => {
    const { Email, Password } = req.body;

    if (!Email || !Password) {
        return res.status(400).json({ message: "Email and Password are required" });
    }

    try {
        // Query the database to find the user by email
        DB.query("SELECT * FROM members WHERE Email = ?", [Email], async (err, result, fields) => {
            if (err) {
                console.error(err);
                return res.status(500).json({ message: "Database error" });
            }

            if (result.length === 0) {
                return res.status(400).json({ message: "User not found" });
            }

            const user = result[0];

            // Compare the provided password with the hashed password stored in the database
            const passwordMatch = await bcrypt.compare(Password, user.Password);

            if (passwordMatch) {
                return res.status(200).json({ message: "Login successful", UserID: user.UserID });
            } else {
                return res.status(400).json({ message: "Password incorrect" });
            }
        });
    } catch (error) {
        console.log(error);
        return res.status(500).json({ message: "Internal Server Error" });
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
    const { UserID } = req.query;
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

app.patch("/update/profile/:UserID", async (req, res) => {
    const UserID = req.params.UserID;
    const { Username,Email,tel } = req.body;
    try {
        DB.query(
            "update members set Username = ?,Email = ?,tel = ? where UserID = ?",
            [Username,Email,tel,UserID],
            (err, result, fields) => {
                if (err) {
                    console.log(err);
                    return res.status(400).send();
                }
                res.status(200).json({ message: "User updated successfully!"});
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
    const { name } = req.query; // ใช้ req.query เพื่อรับ query parameters
    try {
        const query = "SELECT * FROM products WHERE name LIKE ? LIMIT 1";

        DB.query(query, [`%${name}%`], (err, result) => {
            if (err) {
                console.log(err);
                return res.status(500).send("Internal Server Error"); // แก้ status เป็น 500 เนื่องจากมีข้อผิดพลาดในเซิร์ฟเวอร์
            }

            if (result.length === 0) {
                return res.status(404).send("Product not found"); // แก้ status เป็น 404 เมื่อไม่พบสินค้า
            }

            return res.status(200).json(result[0]); // ส่งข้อมูลแรกที่พบกลับในรูปแบบ JSON
        });
    } catch (error) {
        console.log(error);
        return res.status(500).send("Internal Server Error");
    }
});


app.get('/product/size', async (req, res) => {
    const {name} = req.query;
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
    const {Pro_id ,name,color,size,brand,types,price, amount} = req.body;
    try {
        DB.query(
            "update products set amount = ?,name = ?,color = ?,size = ?,brand = ?,types = ?,price = ? where Pro_id = ?",
            [amount ,name,color,size,brand,types,price, Pro_id],
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

app.get('/favorites/user', async (req, res) => {
    const { UserID } = req.query; // ใช้ req.query เพื่อรับค่า UserID จาก query parameters

    try {
        const query = `
            SELECT P.*, F.*
            FROM products P
            INNER JOIN favorites F ON P.Pro_id = F.Pro_id
            WHERE F.UserID = ?;
        `;

        DB.query(query, [UserID], (err, result) => {
            if (err) {
                console.log(err);
                return res.status(400).send();
            }

            return res.status(200).json(result);
        });
    } catch (error) {
        console.log(error);
        return res.status(500).send();
    }
});


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
            "delete from favorites where Fa_id = ? ",
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
//                             location
//----------------------------------------------------------------

app.patch('/location', async (req, res) => {
    const { country, district, province, postcode, UserID } = req.body;

    try {
        // ก่อนอื่นตรวจสอบข้อมูลโดยใช้ UserID
        DB.query(
            `SELECT * FROM locations WHERE UserID = ?;`,
            [UserID],
            (err, result, fields) => {
                if (err) {
                    console.log(err);
                    return res.status(400).send();
                }

                // ถ้ามีข้อมูลที่ตรงกับ UserID
                if (result.length > 0) {
                    // ทำการอัปเดตข้อมูลที่มีอยู่
                    DB.query(
                        `UPDATE locations
                        SET country = ?, district = ?, province = ?, postcode = ?
                        WHERE UserID = ?;`,
                        [country, district, province, postcode, UserID],
                        (err, result, fields) => {
                            if (err) {
                                console.log(err);
                                return res.status(400).send();
                            }
                            return res.status(200).json({ message: "Location updated successfully!" });
                        }
                    );
                } else {
                    // ถ้าไม่มีข้อมูล ให้สร้างข้อมูลใหม่
                    DB.query(
                        `INSERT INTO locations (country, district, province, postcode, UserID)
                        VALUES (?, ?, ?, ?, ?);`,
                        [country, district, province, postcode, UserID],
                        (err, result, fields) => {
                            if (err) {
                                console.log(err);
                                return res.status(400).send();
                            }
                            return res.status(201).json({ message: "New Location created successfully!" });
                        }
                    );
                }
            }
        );
    } catch (error) {
        console.log(error);
        return res.status(500).send();
    }
});

app.get('/location/user', async (req, res) => {
    const { UserID } = req.query; // ใช้ req.query เพื่อรับค่า UserID จาก query parameters

    try {
        const query = `
            SELECT * FROM locations WHERE UserID = ?;
        `;

        DB.query(query, [UserID], (err, result) => {
            if (err) {
                console.log(err);
                return res.status(400).send();
            }

            return res.status(200).json(result);
        });
    } catch (error) {
        console.log(error);
        return res.status(500).send();
    }
});

//----------------------------------------------------------------
//  GET /                   BuyProducts
//----------------------------------------------------------------

app.post('/buyProducts', (req, res) => {
    const { UserID, amount, Pro_id } = req.body; // เพิ่ม Pro_id ในการดึงค่าจาก req.body

    try {
        DB.beginTransaction((err) => {
            if (err) {
                console.log(err);
                return res.status(500).send();
            }

            DB.query(
                'DELETE FROM cart WHERE UserID = ?',
                [UserID],
                (err, result) => {
                    if (err) {
                        console.log(err);
                        DB.rollback(() => {
                            return res.status(400).send();
                        });
                    } else {
                        const values = Pro_id.map((element) => [UserID, amount, element]);

                        DB.query(
                            'INSERT INTO payments (UserID, amount, pro_id) VALUES ?',
                            [values],
                            (err, result) => {
                                if (err) {
                                    console.log(err);
                                    DB.rollback(() => {
                                        return res.status(400).send();
                                    });
                                } else {
                                    DB.commit((err) => {
                                        if (err) {
                                            console.log(err);
                                            DB.rollback(() => {
                                                return res.status(500).send();
                                            });
                                        } else {
                                            res.status(200).send();
                                        }
                                    });
                                }
                            }
                        );
                    }
                }
            );
        });
    } catch (error) {
        console.log(error);
        return res.status(500).send();
    }
});

app.get('/payments', (req, res) => {
    const { UserID } = req.query; // ใช้ req.query เพื่อรับค่า UserID จาก query parameters

    try {
        const query = `
            SELECT * FROM payments WHERE UserID = ?;
        `;

        DB.query(query, [UserID], (err, result) => {
            if (err) {
                console.log(err);
                return res.status(400).send();
            }

            return res.status(200).json(result);
        });
    } catch (error) {
        console.log(error);
        return res.status(500).send();
    }
})

// ฟังก์ชันสำหรับลบข้อมูลในฐานข้อมูล
function deleteOldData() {
    const oneHourAgo = new Date(Date.now() - 60 * 60 * 1000); // 1 ชั่วโมงที่ผ่านมา
    const sql = 'DELETE FROM payments WHERE Date < ?';

    DB.query(sql, [oneHourAgo], (error, results, fields) => {
        if (error) {
            console.error('Error deleting data: ' + error.message);
        } else {
            console.log('Deleted old data.');
        }
    });
}

// ตั้งเวลาเริ่มต้นที่ 0 นาทีของทุกชั่วโมง
const minutesToNextHour = 60 - new Date().getMinutes();
setTimeout(() => {
    deleteOldData(); // เรียกใช้ฟังก์ชันเมื่อเริ่มต้นทุกชั่วโมง
    setInterval(deleteOldData, 60 * 60 * 1000); // จากนี้ทุก 1 ชั่วโมง
}, minutesToNextHour * 60 * 1000); // รอเป็นเวลาจนกระทั่งเริ่มต้นในชั่วโมงถัดไป

//----------------------------------------------------------------

app.listen(port , () => {
    console.log('server listening on port '+port);
})
