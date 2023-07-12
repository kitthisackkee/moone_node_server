const express = require("express")
const app = express()
const cors = require("cors")
const path = require("path")
const expressSanitizer = require("express-sanitizer")

const corsOption = {
    origin: "*", // ["http://x.com", "http://b.com"]
    optionsSuccessStatus: 200
}

app.use(cors(corsOption))

app.use("/image", express.static(path.join(__dirname, "./uploaded")))
app.use(express.json({limit: '3mb'}))
app.use(express.urlencoded({limit: '3mb', extended: true}))
app.use(expressSanitizer())

app.use(function(err, req, res, next) {
    if(err.type == 'entity.too.large'){
        res.status(413).json({message: 'Body is large then 3mb'})
        return;
    }
})




app.use('/api/v1', require('./api/v1/api'))


const server = app.listen(3000, function() {
    const port = server.address().port;
    console.log("Server running on http://localhost:", port)
})