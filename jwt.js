const fs = require("fs")
const path = require("path")
const jwt = require("jsonwebtoken")

const privateKey = fs.readFileSync(path.join(__dirname+"/key/private.key"), "utf-8")
const publicKey = fs.readFileSync(path.join(__dirname+"/key/public.key"), "utf-8")

const signOption = {
    expiresIn: "7d",
    algorithm: "RS256"
}

function sign(payload){
    return jwt.sign(payload, privateKey, signOption)
}

function verify(req, res,next){
    const token = req.headers["x-access-token"]
    if(!token){
        return res.status(401).send({
            auth: false,
            message: "No token provided!!!"
        })
    }

    jwt.verify(token, publicKey, signOption, function(err, decoded) {

        if(err){
            if(err.name == "TokenExpiredError"){
                return res.status(401).send({
                    auth: false,
                    message: "Token is expired!!!"
                })
            }

            return res.status(401).send({
                auth: false,
                message: "Failed to authentication token"
            })
        }

        req.uuid = decoded.uuid;
        req.email = decoded.email;
        next()
    })
}

module.exports = {sign, verify}