const express = require("express");
const router = express.Router();
const db = require("../../db");
const bcrypt = require("bcryptjs");
const moment = require("moment");
const { v4: uuidv4 } = require("uuid");
const jwt = require("../../jwt");

router.post("/access-data", jwt.verify, function(req, res) {
    res.json({
        uuid: req.uuid,
        email: req.email
    })
})

router.post("/register", function (req, res) {
  const uuid = uuidv4();
  const name_ctm = req.sanitize(req.body.name_ctm);
  const address = req.sanitize(req.body.address);
  const tell = req.sanitize(req.body.tell);
  const email = req.sanitize(req.body.email);
  const password = bcrypt.hashSync(req.body.password);

  let sql =
    "INSERT INTO customer (uuid,name_ctm,address,tell,email,password) VALUES ?";
  let value = [[uuid, name_ctm, address, tell, email, password]];

  db.query(sql, [value], function (err, rs) {
    if (err) throw err;

    res.json({
      status: "success",
      message: "Insert success",
    });
  });
});

router.post("/login", function(req, res) {
    const email = req.sanitize(req.body.email)
    const password = req.sanitize(req.body.password)
    let sql = "SELECT uuid,email,password,name_ctm,address,tell FROM customer WHERE email = ? LIMIT 1"
    db.query(sql, [email], function(err, rs ) {
        if(err) throw err;

        if(rs.length > 0){
            const isSuccess = bcrypt.compareSync(password, rs[0].password)
            if(isSuccess == true){
                const payload = {
                    uuid: rs[0].uuid,
                    email: email,
                    
                }

                const token = jwt.sign(payload)

                res.json({
                    status: "success",
                    message: "Login success",
                    token: token,
                    uuid: rs[0].uuid,
                    name_ctm: rs[0].name_ctm,
                    address: rs[0].address,
                    tell: rs[0].tell
                })
            } else{
                res.json({
                    status: "error",
                    message: "Email or password invalid"
                })
            }

        } else {
            res.json({
                status: "error",
                message: "Email or password invalid"
            })
        }
    })
})

module.exports = router;