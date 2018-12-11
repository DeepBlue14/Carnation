##########################################################################
##
## File: server.coffee
## Author: James Kuczynski <jkuczyns@cs.uml.edu>
## File Description: Nodejs server written in coffeescript
##
## Last Modified: 10/16/2018
##
##########################################################################

http = require 'http'
fs   = require 'fs'

server = http.createServer (req, res) ->
    fs.readFile 'demofile1.html', (err, data) ->
        res.writeHeader 200, 'Content-Type': 'text/html'
        res.write data
        res.end()
server.listen 8080
console.log 'Server running at http://localhost:8080/'


