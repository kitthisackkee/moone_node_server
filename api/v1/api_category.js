const express = require("express")
const router = express.Router()
const db = require("../../db")
const moment = require("moment")
const {v4: uuidv4} = require("uuid")
const jwt = require("../../jwt")

router.get("/category",function(req, res) {
    const sql = "SELECT id_type,name_type FROM product_type ORDER BY id_type DESC"
    db.query(sql,function(err, rs) {
        if(err) throw err;
        res.json(rs)
    })
})

// router.get("/product/category",function(req, res) {
//     const sql = "SELECT id_type,name_type FROM product_type ORDER BY id_type DESC"
//     db.query(sql,function(err, rs) {
//         if(err) throw err;
//         res.json(rs)
//     })
// })

router.get("/product/:category_id/:name_pro", function(req, res) {
    const category_id = req.sanitize(req.params.category_id);
    const name_pro = req.sanitize(req.params.name_pro);

    let sql= `SELECT id_pro,name_pro,type_p,qty,price,picture,detail FROM product WHERE type_p = ? OR name_pro LIKE ? ORDER BY id_pro DESC`
    db.query(sql,[category_id,`%${name_pro}%`], function(err, rs) {
        if(err) throw err;
        res.json(rs)
    })
})

router.get("/product/:search_name", function(req, res) {
    const name_pro = req.sanitize(req.params.name_pro);

    let sql= "SELECT id_pro,name_pro,type_p,qty,price,picture,detail FROM product WHERE name_pro = ? ORDER BY id_pro DESC"
    db.query(sql,[name_pro], function(err, rs) {
        if(err) throw err;
        res.json(rs)
    })
})

router.get("/product_list", function(req, res) {
    let sql= "SELECT id_pro,name_pro,type_p,qty,price,picture,detail FROM product  ORDER BY id_pro DESC"
    db.query(sql, function(err, rs) {
        if(err) throw err;
        res.json(rs)
    })
})

router.get("/product_detail/:uuid", function(req, res) {
    const uuid = req.sanitize(req.params.uuid);
    let sql= "SELECT id_pro,name_pro,type_p,qty,price,picture,detail FROM product WHERE id_pro = ? ORDER BY id_pro DESC"
    db.query(sql,[uuid], function(err, rs) {
        if(err) throw err;
        
        if(rs.length > 0){
            res.json(rs[0])
        } else{
            res.json([])
        }
    })
})



module.exports = router;