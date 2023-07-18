const express = require("express")
const router = express.Router()

const loginAPI = require("./api_login")
const categoryAPI = require("./api_category")
const productgoryAPI = require("./api_product")

router.use(loginAPI)
router.use(categoryAPI)
router.use(productgoryAPI)

module.exports = router