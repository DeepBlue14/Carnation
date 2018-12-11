function flip_goal_image(elem)
{
    var dirName = elem.options[elem.selectedIndex].text; // Get the selected option's text
    dirName = dirName.replace(/\s/g,'');                 // Remove whitespace
    //console.log("dirName: " + dirName);

    var imgName = dirName.replace(/([A-Z])/g, "_$1").toLowerCase(); // Replace uppercase with lowercase and underscore
    imgName = imgName.substr(1);                                            // Remove the first underscore
    var myPath = "../res/arc/UMassLowell/North/" + dirName + "/" + imgName + ".png"; // Cat path
    //$(document.getElementById("goal_location_img") ).src = myPath;
    document.getElementById("goal_location_img").src = myPath;          // Insert new image
    //console.log(myPath)
}


function flip_start_image(elem)
{
    var dirName = elem.options[elem.selectedIndex].text; // Get the selected option's text
    dirName = dirName.replace(/\s/g,'');                 // Remove whitespace
    //console.log("dirName: " + dirName);

    var imgName = dirName.replace(/([A-Z])/g, "_$1").toLowerCase(); // Replace uppercase with lowercase and underscore
    imgName = imgName.substr(1);                                            // Remove the first underscore
    var myPath = "../res/arc/UMassLowell/North/" + dirName + "/" + imgName + ".png"; // Cat path
    //$(document.getElementById("start_location_img") ).src = myPath;
    document.getElementById("start_location_img").src = myPath;         // Insert new image
    //console.log(myPath)
}
