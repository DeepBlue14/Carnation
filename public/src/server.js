// Generated by CoffeeScript 1.9.3
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

//# sourceMappingURL=server.js.map