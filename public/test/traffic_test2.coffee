##
#
#
##

Image   = require './../src/sensor_msgs/Image.coffee'
Traffic = require './../src/world/Traffic.coffee'

img1 = new Image.Image('../res/image/james.png')
#make copies
img2 = new Image.Image('../res/image/james.png')
img3 = new Image.Image('../res/image/james.png')

traffic1 = new Traffic.Traffic(img)
traffic2 = new Traffic.Traffic(img)
traffic1.generateUniform()
traffic2.generateUniform()

for i in [0...10]
    traffic1.updateTraffic()
    console.log traffic1.toString()
    traffic2.updateTraffic()
    console.log traffic2.toString()
