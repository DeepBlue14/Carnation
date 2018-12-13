var lastName, firstName, email, username, psw;

function sign_up()
{
    var isValid = false;
    lastName  = document.getElementById("last_name_input").value;
    firstName = document.getElementById("first_name_input").value;
    email     = document.getElementById("email_input").value;
    username  = document.getElementById("username_input").value;
    psw       = document.getElementById("psw_input").value;
    var pswRepeat = document.getElementById("psw_repeat_input").value;

    //https://stackoverflow.com/questions/12290572/appending-to-json-file-in-javascript
    /*
    var rawTxt = readTextFile("../db/users.json");
    var data = JSON.parse(rawTxt);
    data.users.push({firstName:firstName,
                     lastName:lastName,
                     email:email,
                     username:username,
                     password:psw});

    */
    console.log("HERE (1)");


    loadJSON(function(response){
        var actual_JSON = JSON.parse(response);
        console.log(actual_JSON);
        actual_JSON.users.push({firstName:"firstName",
                                lastName:"lastName",
                                email:"email",
                                username:"username",
                                password:"psw"});
    });


    console.log("HERE (2)");

    if(psw === pswRepeat)
    {
        //create account
        writeJSON(function(response){
            var actual_JSON = JSON.parse(response);
            console.log(actual_JSON);
            actual_JSON.users.push({firstName:"firstName",
                lastName:"lastName",
                email:"email",
                username:"username",
                password:"psw"});
        });
    }

    return false;//TODO: fix
}

function loadJSON(callback) {

    var xobj = new XMLHttpRequest();
    xobj.overrideMimeType("application/json");
    xobj.open('GET', 'users.json', false); // Replace 'my_data' with the path to your file
    xobj.onreadystatechange = function () {
        if (xobj.readyState == 4 && xobj.status == "200") {
            // Required use of an anonymous callback as .open will NOT return a value but simply returns undefined in asynchronous mode
            callback(xobj.responseText);
        }
    };
    xobj.send(null);
}


function writeJSON(callback) {

    function sendToServer(data) {
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "http://localhost:8000/" + data, true);
        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4 && xhr.status == 200) {
                ;//alert(xhr.responseText);
            }
        };
        xhr.send();
    }
    sendToServer('firstName='+firstName+'=lastName='+lastName+'=email='+email+'=username='+username+'=password='+psw);
}