/*
 * File: server.js
 * Author: James Kuczynski
 * File Description: Test server in NodeJS
 *
 * Last Modified 11/20/2018
 */


(function() {
  var fs, http, server;

  http = require('http');

  fs = require('fs');

  server = http.createServer(function(req, res) {
    return fs.readFile('demofile1.html', function(err, data) {
      res.writeHeader(200, {
        'Content-Type': 'text/html'
      });
      res.write(data);
      return res.end();
    });
  });

  server.listen(8080);

  console.log('Server running at http://localhost:8080/');

}).call(this);
