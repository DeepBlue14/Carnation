function sign_up()
{
    var isValid = false;
    var lastName  = document.getElementById("last_name_input").value;
    var firstName = document.getElementById("first_name_input").value;
    var email     = document.getElementById("email_input").value;
    var username  = document.getElementById("username_input").value;
    var psw       = document.getElementById("psw_input").value;
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
    }

    return false;
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