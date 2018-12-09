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



    console.log("startTxt: " + startTxt);
    console.log("startFloor: " + startFloor);
    console.log("goalTxt: " + goalTxt);
    console.log("goalFloor: " + goalFloor);
    console.log("startRoom: " + startRoom);
    console.log("goalRoom: " + goalRoom);

    //iff
    return isValid;
}

