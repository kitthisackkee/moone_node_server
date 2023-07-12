const express = require("express")
const router = express.Router()

const loginAPI = require("./api_login")

router.use(loginAPI)

module.exports = router