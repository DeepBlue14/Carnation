### 
# File: graphics.js
# Author: James Kuczynski
# File Description: This file implements the dynamic background using
# 					 Three.js, a WebGL library for creating 3D elements.
# 
# Last Modified: 11/21/2018
###

###*
# Initializes the 3D graphcs for the background objects and adds them
# to the web page. 
###

init = ->
  container = document.createElement('div')
  document.body.appendChild container
  camera = new (THREE.PerspectiveCamera)(50, window.innerWidth / window.innerHeight, 1, 100000)
  camera.position.z = 2000
  r = 'res/'
  urls = [
    r + 'posx.jpg'
    r + 'negx.jpg'
    r + 'posy.jpg'
    r + 'negy.jpg'
    r + 'posz.jpg'
    r + 'negz.jpg'
  ]
  # the camera (i.e. user) will be situated in the center of a 3D cube structure
  # refraction mapping prevents corners from being seen.
  textureCube = (new (THREE.CubeTextureLoader)).load(urls)
  textureCube.mapping = THREE.CubeRefractionMapping
  scene = new (THREE.Scene)
  scene.background = textureCube
  scene.fog = new (THREE.FogExp2)(0x000000, 0.0008)
  # LIGHTS
  ambient = new (THREE.AmbientLight)(0xffffff)
  scene.add ambient
  pointLight = new (THREE.PointLight)(0xffffff, 2)
  scene.add pointLight
  # light representation
  sphere = new (THREE.SphereGeometry)(100, 16, 8)
  mesh = new (THREE.Mesh)(sphere, new (THREE.MeshBasicMaterial)(color: 0xffffff))
  mesh.scale.set 0.05, 0.05, 0.05
  pointLight.add mesh
  #create the 3D renderer and add it to the web page
  renderer = new (THREE.WebGLRenderer)
  renderer.setPixelRatio window.devicePixelRatio
  renderer.setSize window.innerWidth, window.innerHeight
  container.appendChild renderer.domElement
  #statistics
  #stats = new Stats();
  #container.appendChild(stats.dom);
  geometry = new (THREE.Geometry)
  textureLoader = new (THREE.TextureLoader)
  sprite1 = textureLoader.load(r + 'snowflake.png')
  sprite2 = textureLoader.load(r + 'snowflake.png')
  sprite3 = textureLoader.load(r + 'snowflake.png')
  sprite4 = textureLoader.load(r + 'snowflake2.png')
  sprite5 = textureLoader.load(r + 'snowflake2.png')
  #create snowflakes (the ... * 10000 sets initial position)
  i = 0
  while i < 100000
    vertex = new (THREE.Vector3)
    vertex.x = Math.random() * 10000 - 1000
    vertex.y = Math.random() * 10000 - 1000
    vertex.z = Math.random() * 10000 - 1000
    geometry.vertices.push vertex
    i++
  parameters = [
    [
      [
        1.0
        0.2
        0.5
      ]
      sprite2
      20
    ]
    [
      [
        0.95
        0.1
        0.5
      ]
      sprite3
      15
    ]
    [
      [
        0.90
        0.05
        0.5
      ]
      sprite1
      10
    ]
    [
      [
        0.85
        0
        0.5
      ]
      sprite5
      8
    ]
    [
      [
        0.80
        0
        0.5
      ]
      sprite4
      5
    ]
  ]
  i = 0
  while i < parameters.length
    sprite = parameters[i][1]
    size = parameters[i][2]
    materials[i] = new (THREE.PointsMaterial)(
      size: size
      map: sprite
      blending: THREE.AdditiveBlending
      depthTest: false
      transparent: true)
    particles = new (THREE.Points)(geometry, materials[i])
    particles.rotation.x = Math.random() * 6
    particles.rotation.y = Math.random() * 6
    particles.rotation.z = Math.random() * 6
    scene.add particles
    i++
  window.addEventListener 'resize', onWindowResize, false
  return

###*
# Resizes the 3D elements when the page is resized.
# 
###

onWindowResize = ->
  windowHalfX = window.innerWidth / 2
  windowHalfY = window.innerHeight / 2
  camera.aspect = window.innerWidth / window.innerHeight
  camera.updateProjectionMatrix()
  renderer.setSize window.innerWidth, window.innerHeight
  return

###*
# Function the three.js API calls to update the UI.
###

animate = ->
  requestAnimationFrame animate
  render()
  #stats.update(); // update the statistics element
  return

###*
# Re-renders the 3D elements.  Also contains  
###

render = ->
  # get time to update snow.
  time = Date.now() * 0.00005
  i = 0
  while i < scene.children.length
    object = scene.children[i]
    # rotate snow
    if object instanceof THREE.Points
      object.rotation.x = time * (if i < 4 then i + 1 else -(i + 1))
      #up and down
      object.rotation.y = time * (if i < 4 then i + 1 else -(i + 1))
      #left and right
      object.rotation.z = time * (if i < 4 then i + 1 else -(i + 1))
      #forward and backward
    i++
  # rotate woods box left in a circle
  camera.rotation.y += 0.001
  renderer.render scene, camera
  return

'use strict'
# check to see if the user has WebGL enabled on their browser
if !Detector.webgl
  Detector.addGetWebGLMessage()
# variables for the background animation
container = undefined
#var stats;
camera = undefined
scene = undefined
renderer = undefined
geometry = undefined
pointLight = undefined
windowHalfX = window.innerWidth / 2
windowHalfY = window.innerHeight / 2
# variables for snowflake animation            
materials = []
parameters = undefined
i = undefined
h = undefined
sprite = undefined
size = undefined
#start the UI
init()
animate()
