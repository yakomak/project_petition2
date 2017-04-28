express = require "express"
fs = require "fs"

data = JSON.parse(fs.readFileSync("data.json", 'utf-8'))

app = express()

  
app.get '/', (req, res) ->
    console.log(req.query)
    if req.query.email
        data.push(req.query)
        fs.writeFile "data.json", JSON.stringify(data, null, "  "), "utf-8", () ->
            console.log("write", data)
    res.sendFile(__dirname+'/index.html')

app.get '/dtjs', (req, res) ->
    console.log(req.query)
    if req.query.text1
        data.push(req.query)
        fs.readFile "data.json", JSON.stringify(data, null, "  "), "utf-8", #() #->
           # console.log("read", data)
    res.sendFile(__dirname+'/datajson.html')


port = process.env.PORT || 3333
app.listen(port)
console.log "start server on port #{port}"