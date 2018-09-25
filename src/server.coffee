http = require 'http'
fs   = require 'fs'

server = http.createServer (req, res) ->
    fs.readFile 'demofile1.html', (err, data) ->
        res.writeHeader 200, 'Content-Type': 'text/html'
        res.write data
        res.end()
server.listen 8080
console.log 'Server running at http://localhost:8080/'


