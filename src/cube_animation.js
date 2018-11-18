/*
 * File: cube_animation.js
 * Author: James Kuczyznski
 * File Description: Cube animation
 *
 * Ref: Based on: http://bl.ocks.org/nitaku/427c1ffc346ed9286fda
 * Last Modified: 11/17/2018
 */

var scene;
var camera;

// 3D rotation
var xRotation = 0.0;
var yRotation = 0.0;
var zRotation = 0.0;

var cubeMesh;


function run_cube_animation()
{
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
    var neheTexture = new THREE.ImageUtils.loadTexture("res/image/marigold_icon.png");
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
    renderer.render(scene, camera);
}
