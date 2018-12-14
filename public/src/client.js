"use strict";


function launch_search()
{
    var isValid = false;

    var elem = document.getElementById("start_location");
    var startTxt = document.getElementById("start_location").options[elem.selectedIndex].text;
    var startFloor = document.getElementById("start_floor").value;
    elem = document.getElementById("goal_location");
    var goalTxt = document.getElementById("goal_location").options[elem.selectedIndex].text;
    var goalFloor = document.getElementById("goal_floor").value;

    var startRoom = document.getElementById("start_room_number").value;
    var goalRoom = document.getElementById("goal_room_number").value;

    if(startRoom > goalRoom)
    {
        var tmp = goalRoom;
        goalRoom = startRoom;
        startRoom = tmp;
    }

    if(startTxt != "Olsen Hall" || goalTxt != "Olsen Hall")
    {
        alert("Since the floorplans do not contain clear room numbers\nthese had to be manually added.  As a result, please use the third floor of Olsen Hall, rooms 301-318");
        return false;
    }

    console.log("startTxt: " + startTxt);
    console.log("startFloor: " + startFloor);
    console.log("goalTxt: " + goalTxt);
    console.log("goalFloor: " + goalFloor);
    console.log("startRoom: " + startRoom);
    console.log("goalRoom: " + goalRoom);

    var startX, startY, goalX, goalY;
    var foundStart = false;
    var foundGoal = false;

    loadJSON(function(response){
        var actual_JSON = JSON.parse(response);
        console.log(actual_JSON);
        console.log(actual_JSON.database.university[0].campus[0].buildings[11].name);
        console.log(actual_JSON.database.university[0].campus[0].buildings[11].floors[startFloor].stage);
        var stageArr = actual_JSON.database.university[0].campus[0].buildings[11].floors[startFloor].stage;
        for(var i = 0; i < stageArr.length; i++)
        {
            console.log(stageArr[i].room + " <> " + startRoom);
            //if(stageArr[i].room == startRoom)
            {
                console.log("Found start room: (" + stageArr[i].x + ", " + stageArr[i].y + ")");
                startX = stageArr[i].x;
                startY = stageArr[i].y;
                foundStart = true;
            }
            //if(stageArr[i].room == goalRoom)
            {
                console.log("Found goal room: (" + stageArr[i].x + ", " + stageArr[i].y + ")");
                goalX = stageArr[i].x;
                goalY = stageArr[i].y;
                foundGoal = true;
            }
        }


    });

    if(foundStart == true && foundGoal == true)
    {
        isValid = true; //FIXME: turn on
        /*
        loadJSON(function(response){
            var actual_JSON = JSON.parse(response);
            console.log(actual_JSON);
            for(idx in actual_JSON.path)
            {
                val = ref[idx];
                console.log(val.y + ", " + val.x);
            }

        });
        */

        /*
        console.log("startTxt: " + startTxt);
        console.log("startFloor: " + startFloor);
        console.log("goalTxt: " + goalTxt);
        console.log("goalFloor: " + goalFloor);
        console.log("startRoom: " + startRoom);
        console.log("goalRoom: " + goalRoom);
         */

        var form = document.getElementById("starter");
        var input;

        //Building (start)
        input = document.createElement("input");
        input.type = "hidden";
        input.name = "building_start";
        input.value = startTxt;
        form.appendChild(input);
        form.appendChild(document.createElement("br") );

        //Floor (start)
        input = document.createElement("input");
        input.type = "hidden";
        input.name = "floor_start";
        input.value = startFloor;
        form.appendChild(input);
        form.appendChild(document.createElement("br") );

        //Room (start)
        input = document.createElement("input");
        input.type = "hidden";
        input.name = "room_start";
        input.value = startRoom;
        form.appendChild(input);
        form.appendChild(document.createElement("br") );

        //Building (end)
        input = document.createElement("input");
        input.type = "hidden";
        input.name = "building_goal";
        input.value = goalTxt;
        form.appendChild(input);
        form.appendChild(document.createElement("br") );

        //Floor (end)
        input = document.createElement("input");
        input.type = "hidden";
        input.name = "floor_goal";
        input.value = goalFloor;
        form.appendChild(input);
        form.appendChild(document.createElement("br") );

        //Room (end)
        input = document.createElement("input");
        input.type = "hidden";
        input.name = "room_goal";
        input.value = goalRoom;
        form.appendChild(input);
        form.appendChild(document.createElement("br") );
    }

    return isValid;
}


function loadJSON(callback) {

    var xobj = new XMLHttpRequest();
    xobj.overrideMimeType("application/json");
    xobj.open('GET', 'UMassLowell.json', false); // Replace 'my_data' with the path to your file
    xobj.onreadystatechange = function () {
        if (xobj.readyState == 4 && xobj.status == "200") {
            // Required use of an anonymous callback as .open will NOT return a value but simply returns undefined in asynchronous mode
            callback(xobj.responseText);
        }
    };
    xobj.send(null);
}
