const express = require("express");
const router = express.Router();
const db = require("../../db");
const bcrypt = require("bcryptjs");
const moment = require("moment");
const { v4: uuidv4 } = require("uuid");
const jwt = require("../../jwt");

router.post("/product/add-cart", function (req, res) {
  // let bill_id = Math.floor(Math.random() * (1000000 - 100 + 1)) + 100;

  const id_sale = req.sanitize(req.body.id_sale);
  const id_pro = req.sanitize(req.body.id_pro);
  const qty = req.sanitize(req.body.qty);
  const price = req.sanitize(req.body.price);
  // const total = req.sanitize(req.body.total);

  let sql = "SELECT qty FROM sale_detail WHERE id_sale = ? AND id_pro = ?";

  db.query(sql, [id_sale, id_pro], function (err, rs) {
    if (err) throw err;
    if (rs.length > 0) {
      sql = "UPDATE sale_detail SET ? WHERE id_sale = ? AND id_pro = ?";

      let value = {
        qty: Number(rs[0].qty) + Number(qty),
      };

      db.query(sql, [value, id_sale, id_pro], function (err, rs) {
        if (err) throw err;
        res.json({
          status: "Update cart success",
        });
      });
    } else {
      sql = "INSERT INTO sale_detail (id_sale, id_pro, qty, price) VALUES ?";
      let value = [[id_sale, id_pro, qty, price]];
      db.query(sql, [value], function (err, rs) {
        if (err) throw err;
        res.json({
          status: "success",
        });
      });
    }
  });
});

router.post("/product/get-cart", function (req, res) {
  console.log(req.body);
  const id_sale = req.sanitize(req.body.id_sale);
  let sql = `SELECT sale_detail.id_sale, product.id_pro, product.name_pro, sale_detail.qty, 
              sale_detail.price, product.picture, product.detail FROM sale_detail
              INNER JOIN product ON sale_detail.id_pro = product.id_pro
              WHERE sale_detail.id_sale = ? ORDER BY sale_detail.id_sale ASC`;
  db.query(sql, [id_sale], function (err, rs) {
    if (err) throw err;
    res.json(rs);
  });
});

router.post("/product/delete-cart", function (req, res) {
  const id_sale = req.sanitize(req.body.id_sale);
  const id_pro = req.sanitize(req.body.id_pro);

  let sql = `DELETE FROM sale_detail WHERE id_sale = ? AND id_pro = ?`;
  db.query(sql, [id_sale, id_pro, "No"], function (err, rs) {
    if (err) throw err;
    res.json({
      status: "success",
      message: "Delete cart success",
    });
  });
});

router.post("/product/update-cart", function (req, res) {
  const id_sale = req.sanitize(req.body.id_sale);
  const id_pro = req.sanitize(req.body.id_pro);
  const option = req.sanitize(req.body.option);

  let sql = "SELECT qty FROM sale_detail WHERE id_sale = ? AND id_pro = ?";
  db.query(sql, [id_sale, id_pro], function (err, rs) {
    if (err) throw err;
    if (rs.length > 0) {
      sql = "UPDATE sale_detail SET ? WHERE id_sale = ? AND id_pro = ?";

      let newQty = 0;
      if (option == "increase") {
        newQty = Number(rs[0].qty) + 1;
      } else if (option == "decrease") {
        newQty = Number(rs[0].qty) - 1;
      }

      let value = {
        qty: newQty,
      };
      db.query(sql, [value, id_sale, id_pro], function (err, rs) {
        if (err) throw err;
        res.json({
          status: "Update qty cart success",
        });
      });
    }
  });
});

router.post("/product/order", function (req, res) {
  const id_sale = req.sanitize(req.body.id_sale);
  const sale_status = 2;
  const total = req.sanitize(req.body.total);
  const name = req.sanitize(req.body.name);
  const tell = req.sanitize(req.body.tell);
  const village = req.sanitize(req.body.village);
  const district = req.sanitize(req.body.district);
  const province = req.sanitize(req.body.province);

  // const created_date = moment().format("YYYY-MM-DD H:m:s")
  const sql =
    "INSERT INTO sale (id_sale, sale_status,total, name, tell, village, district, province) VALUES ?";
  const value = [
    [id_sale, sale_status, total, name, tell, village, district, province],
  ];
  db.query(sql, [value], function (err, rs) {
    if (err) throw err;
    res.json({
      status: "success",
    });
  });
});

router.post("/product/search-product", function (req, res) {
  const name_pro = req.sanitize(req.body.name_pro);
 

  let sql = `SELECT product.* FROM product WHERE product.name_pro = ?`;
  db.query(sql, [name_pro,], function (err, rs) {
    if (err) throw err;
    res.json({
      status: "success",
      message: "Search Product success",
    });
  });
});
module.exports = router;
