/* 
 * File: graphics.js
 * Author: James Kuczynski
 * File Description: This file implements the dynamic background using
 * 					 Three.js, a WebGL library for creating 3D elements.
 * 
 * Created: 11/29/2016 by J.K.
 * Last Modified: 12/06/2016 by J.K.
 */


"use strict";

// check to see if the user has WebGL enabled on their browser
if (!Detector.webgl)
    Detector.addGetWebGLMessage();

// variables for the background animation
var container;
//var stats;
var camera;
var scene;
var renderer;
var geometry;
var pointLight;
var windowHalfX = window.innerWidth / 2;
var windowHalfY = window.innerHeight / 2;

// variables for snowflake animation            
var materials = [];
var parameters;
var i;
var h;
var sprite;
var size;

var pathIdx;

//start the UI

var newimg;


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




/**
 * Initializes the 3D graphics for the background objects and adds them
 * to the web page. 
 */
function init() {
    //fast_snatch(); // Load URL params
    //document.getElementById("img1").src = "olsen_hall_floor1.png";

    container = document.createElement('div');
    document.body.appendChild(container);

    async(foo, function(){ 
        console.log('async callback');
    });

    camera = new THREE.PerspectiveCamera(50, window.innerWidth / window.innerHeight, 1, 100000);
    camera.position.z = 2000;

    var r = "res/";
    var urls = [
        r + "posx.jpg", r + "negx.jpg",
        r + "posy.jpg", r + "negy.jpg",
        r + "posz.jpg", r + "negz.jpg"
    ];

    // the camera (i.e. user) will be situated in the center of a 3D cube structure
    // refraction mapping prevents corners from being seen.
    var textureCube = new THREE.CubeTextureLoader().load(urls);
    textureCube.mapping = THREE.CubeRefractionMapping;

    scene = new THREE.Scene();
    scene.background = textureCube;
    scene.fog = new THREE.FogExp2(0x000000, 0.0008);

    // LIGHTS
    var ambient = new THREE.AmbientLight(0xffffff);
    scene.add(ambient);

    pointLight = new THREE.PointLight(0xffffff, 2);
    scene.add(pointLight);

    // light representation
    var sphere = new THREE.SphereGeometry(100, 16, 8);

    var mesh = new THREE.Mesh(sphere, new THREE.MeshBasicMaterial({color: 0xffffff}));
    mesh.scale.set(0.05, 0.05, 0.05);
    pointLight.add(mesh);


    //create the 3D renderer and add it to the web page
    renderer = new THREE.WebGLRenderer();
    renderer.setPixelRatio(window.devicePixelRatio);
    renderer.setSize(window.innerWidth, window.innerHeight);
    container.appendChild(renderer.domElement);

    //statistics
    //stats = new Stats();
    //container.appendChild(stats.dom);

    geometry = new THREE.Geometry();

    var textureLoader = new THREE.TextureLoader();

    var sprite1 = textureLoader.load(r + "snowflake.png");
    var sprite2 = textureLoader.load(r + "snowflake.png");
    var sprite3 = textureLoader.load(r + "snowflake.png");
    var sprite4 = textureLoader.load(r + "snowflake2.png");
    var sprite5 = textureLoader.load(r + "snowflake2.png");

    //create snowflakes (the ... * 10000 sets initial position)
    for (i = 0; i < 100000; i++) {

        var vertex = new THREE.Vector3();
        vertex.x = Math.random() * 10000 - 1000;
        vertex.y = Math.random() * 10000 - 1000;
        vertex.z = Math.random() * 10000 - 1000;

        geometry.vertices.push(vertex);
    }


    parameters = [
        [[1.0, 0.2, 0.5], sprite2, 20],
        [[0.95, 0.1, 0.5], sprite3, 15],
        [[0.90, 0.05, 0.5], sprite1, 10],
        [[0.85, 0, 0.5], sprite5, 8],
        [[0.80, 0, 0.5], sprite4, 5]
    ];

    for (i = 0; i < parameters.length; i++) {

        sprite = parameters[i][1];
        size = parameters[i][2];

        materials[i] = new THREE.PointsMaterial({size: size, 
                                                 map: sprite, 
                                                 blending: THREE.AdditiveBlending,
                                                 depthTest: false,
                                                 transparent: true});

        var particles = new THREE.Points(geometry, materials[i]);
        particles.rotation.x = Math.random() * 6;
        particles.rotation.y = Math.random() * 6;
        particles.rotation.z = Math.random() * 6;

        scene.add(particles);
    }
    
    window.addEventListener('resize', onWindowResize, false);
}

/**
 * Resizes the 3D elements when the page is resized.
 * 
 */
function onWindowResize() {

    windowHalfX = window.innerWidth / 2,
            windowHalfY = window.innerHeight / 2,
            camera.aspect = window.innerWidth / window.innerHeight;
    camera.updateProjectionMatrix();

    renderer.setSize(window.innerWidth, window.innerHeight);
}

/**
 * Function the three.js API calls to update the UI.
 */
function animate() {

    requestAnimationFrame(animate);

    render();
    //stats.update(); // update the statistics element
}

/**
 * Re-renders the 3D elements.  Also contains  
 */
function render() {

    // get time to update snow.
    var time = Date.now() * 0.00005;

    for (i = 0; i < scene.children.length; i++) {

        var object = scene.children[i];

        // rotate snow
        if(object instanceof THREE.Points) {

            object.rotation.x = time * (i < 4 ? i + 1 : -(i + 1)); //up and down
            object.rotation.y = time * (i < 4 ? i + 1 : -(i + 1)); //left and right
            object.rotation.z = time * (i < 4 ? i + 1 : -(i + 1)); //forward and backward
        }
    }

    // rotate woods box left in a circle
    camera.rotation.y += 0.001;

    renderer.render(scene, camera);
}


function async(fn, callback) {
    console.log("async(...)");
    setTimeout(function() {
        //fn();
        doStuff();
        callback();
        console.log("Bang!");
    }, 0);
}

function foo() {
    console.log("foo");
}

function doStuff() {
    console.log("doStuff()");
    var c=document.getElementById("myCanvas");
    var ctx=c.getContext("2d");

    var img = new Image();
    img.onload = function() {
        //var img=document.getElementById("img1");
        ctx.drawImage(img, 0, 0);

        //////////////////////////////////

        ///////////////////////////////////

        //Declare variables
        var imgData = ctx.getImageData(0, 0, c.width, c.height);
        var data = imgData.data;

        var red = [];
        var green = [];
        var blue = [];
        var alpha = [];


        //read path
        loadJSON(function (response) {
            var actual_JSON = JSON.parse(response);
            console.log(actual_JSON);
            console.log(actual_JSON.path);
            var pathArr = actual_JSON.path;
            var path1D = [];
            for (var i = 0; i < pathArr.length; i++) {
                //console.log(pathArr[i].x + " <> " + pathArr[i].y);
                //path1D.push(pathIdx = (c.width * pathArr[i].y + pathArr[i].x) << 2);  //twoD2oneD row-major
                path1D.push(pathIdx = (c.width * pathArr[i].x + pathArr[i].y) << 2);    //twoD2oneD column-major
            }


            //Read image and make changes on the fly as it's read
            for (var i = 0; i < data.length; i += 4) {
                red[i] = imgData.data[i];
                green[i] = imgData.data[i + 1];
                blue[i] = imgData.data[i + 2]; // no change, blue == 0 for black and for yellow
                alpha[i] = imgData.data[i + 3]; // Again, no change

                for (var j = 0; j < path1D.length; j++) {
                    if (path1D[j] === i) {
                        red[i] = 100;
                        green[i] = 0;
                        blue[i] = 100;
                        //console.log("update!");
                    }
                }
            }

            // Write the image back to the canvas
            for (var i = 0; i < data.length; i += 4) {
                imgData.data[i] = red[i];
                imgData.data[i + 1] = green[i];
                imgData.data[i + 2] = blue[i];
                imgData.data[i + 3] = alpha[i];
            }


            ctx.putImageData(imgData, 0, 0);


        });
    };
    //img.src = '../res/arc/UMassLowell/North/OlsenHall/olsen_hall_floor1.png';
    console.log('../res/arc/UMassLowell/North/'+startTxt+'/olsen_hall_floor'+startFloor+'.png');
    img.src = '../res/arc/UMassLowell/North/'+startTxt+'/olsen_hall_floor'+startFloor+'.png';
}

function loadJSON(callback) {

    var xobj = new XMLHttpRequest();
    xobj.overrideMimeType("application/json");
    console.log('../res/arc/UMassLowell/North/'+startTxt+'/json/olsen_hall_floor'+startFloor+'-'+startRoom+'_'+goalRoom+'.json');
    xobj.open('GET', '../res/arc/UMassLowell/North/'+startTxt+'/json/olsen_hall_floor'+startFloor+'-'+startRoom+'_'+goalRoom+'.json'/*'path.json'*/, false); // Replace 'my_data' with the path to your file
    xobj.onreadystatechange = function () {
        if (xobj.readyState == 4 && xobj.status == "200") {
            // Required use of an anonymous callback as .open will NOT return a value but simply returns undefined in asynchronous mode
            callback(xobj.responseText);
        }
    };
    xobj.send(null);
}

