function sign_in()
{
    var userTxt = document.getElementById("email_input").value;
    var pswTxt  = document.getElementById("psw_input").value;

    console.log("HERE (1)");

    var isValid = false;
    loadJSON(function(response){
        var actual_JSON = JSON.parse(response);
        console.log(actual_JSON);

        console.log(actual_JSON.users);
        console.log(actual_JSON.users.length);



        for(var i = 0; i < actual_JSON.users.length; i++)
        {
            console.log(userTxt + " <> " + actual_JSON.users[i].username);
            console.log(userTxt + " <> " + actual_JSON.users[i].email);
            console.log(pswTxt  + " <> " + actual_JSON.users[i].password);
            if((userTxt == actual_JSON.users[i].username || userTxt == actual_JSON.users[i].email) && pswTxt == actual_JSON.users[i].password)
            {
                isValid = true;
            }
        }
    });


    console.log("HERE (2)");



    return isValid;
}

function loadJSON(callback) {

    var xobj = new XMLHttpRequest();
    xobj.overrideMimeType("application/json");
    xobj.open('GET', 'html/users.json', false); // Replace 'my_data' with the path to your file
    xobj.onreadystatechange = function () {
        if (xobj.readyState == 4 && xobj.status == "200") {
            // Required use of an anonymous callback as .open will NOT return a value but simply returns undefined in asynchronous mode
            callback(xobj.responseText);
        }
    };
    xobj.send(null);
}