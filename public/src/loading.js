/*
 * File: cube_animation.js
 * Author: James Kuczyznski
 * File Description: Cube animation
 *
 * Ref: Based on: http://bl.ocks.org/nitaku/427c1ffc346ed9286fda
 * Last Modified: 11/17/2018
 */

var startTxt, startFloor, startRoom, goalTxt, goalFloor, goalRoom;

function fast_snatch()
{
    var parameters = location.search.substring(1).split("&");
    console.log("@loading.js::fastch_snatch() params:= " + parameters);
    for(var i = 0; i < parameters.length; i++)
    {
        console.log("param:= " + parameters[i]);
    }

    var temp;
    temp = parameters[0].split("=");
    startTxt = unescape(temp[1]).replace("+", "");
    temp = parameters[1].split("=");
    startFloor = unescape(temp[1]);
    temp = parameters[2].split("=");
    startRoom = unescape(temp[1]);

    temp = parameters[3].split("=");
    goalTxt = unescape(temp[1]).replace("+", "");
    temp = parameters[4].split("=");
    goalFloor = unescape(temp[1]);
    temp = parameters[5].split("=");
    goalRoom = unescape(temp[1]);


    console.log("t1:=" + startTxt + ", t2:=" + startFloor + ", t3:=" + startRoom);



}

function launch_r_search()
{
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




var scene;
var camera;

// 3D rotation
var xRotation = 0.0;
var yRotation = 0.0;
var zRotation = 0.0;

var cubeMesh;

var prefix;
var count = 0


function run_cube_animation(pfx="")
{
    prefix = pfx;
    if(window.WebGLRenderingContext)
    {
        initializeScene();
        animateScene();
    }
    else
    {
        //var canvas = document.getElementById("WebGLCanvas");

    }
}


function initializeScene()
{
    if(Detector.webgl)
    {
        renderer = new THREE.WebGLRenderer({antialias: true});
    }
    else
    {
        renderer = new THREE.CanvasRenderer();
    }

    renderer.setClearColor(0x000000, 1);

    canvasWidth = window.innerWidth / 4;
    canvasHeight = window.innerHeight / 4;

    renderer.setSize(canvasWidth, canvasHeight);
    document.getElementById("WebGLCanvas").appendChild(renderer.domElement);

    scene = new THREE.Scene();

    camera = new THREE.PerspectiveCamera(45, canvasWidth / canvasHeight, 1, 100);
    camera.position.set(0, 0, 10);
    camera.lookAt(scene.position);
    scene.add(camera);

    var boxGeometry = new THREE.BoxGeometry(3.0, 3.0, 3.0);
    var neheTexture = new THREE.ImageUtils.loadTexture(prefix + "res/image/marigold_icon.png");
    var boxMaterial = new THREE.MeshBasicMaterial({
        map: neheTexture,
        side: THREE.DoubleSide
    });

    boxMesh = new THREE.Mesh(boxGeometry, boxMaterial);
    boxMesh.position.set(0.0, 0.0, 4.0);
    scene.add(boxMesh);
}


function animateScene()
{
    // Increase the 3D rotation
    xRotation += 0.03;
    yRotation += 0.02;
    zRotation += 0.04;
    boxMesh.rotation.set(xRotation, yRotation, zRotation);

    requestAnimationFrame(animateScene);

    renderScene();
}


function renderScene()
{
    if(count >= 50)
    {
        count = 0;
        update_ui()
    }
    else
    {
        count++;
    }

    renderer.render(scene, camera);
}

function update_ui()
{
    var elem = document.getElementById('result22');
    elem.disabled = false;
    elem.style.visibility = "visible";
    elem = document.getElementById('load_spiny');
    elem.remove();
    elem = document.getElementById('loading_status');
    elem.innerText = 'Done!';
}

