var http = require('http');
var fs   = require('fs');

const PORT = 8000;

http.createServer((req, res) => {
    var msg = req.url.split('/')[1];
    console.log('Recieved: ' + msg);
    
    //
    fs.readFile('public/html/users.json', function (err, data) {
        var json = JSON.parse(data);
        var userArr = msg.split("=");
        //for(var i = 0; i < userArr.length; i++)
        //    console.log(userArr[i]);
        var firstName = userArr[1];
        var lastName  = userArr[3];
        var email     = userArr[5];
        var username  = userArr[7];
        var psw       = userArr[9];
        var text = '{"firstName":"' + firstName + '",' +
                     '"lastName":"' + lastName  + '",' +
                     '"email":"'     + email     + '",' +
                     '"username":"'  + username  + '",' +
                     '"password":"'  + psw       + '"}';
        var obj = JSON.parse(text);
        json.users.push(obj);
        
        //json.users.push(msg);
        fs.writeFileSync("public/html/users.json", JSON.stringify(json) );
        console.log("wrote");
    });
    //
    
    var html = 'true';
    res.writeHead(200, {"Content-Type": "text/html", "Access-Control-Allow-Origin": "*"});
    res.write(html);
    res.end();
    if(msg == 'end') process.exit();
}).listen(PORT, () => {
    console.log("Server listening on: %s", PORT);
});
