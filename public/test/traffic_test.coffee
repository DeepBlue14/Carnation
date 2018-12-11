##
#
#
##

Image   = require './../src/sensor_msgs/Image.coffee'
Traffic = require './../src/world/Traffic.coffee'

img = new Image.Image('../res/image/james.png')

traffic = new Traffic.Traffic(img)
traffic.generateUniform()

for i in [0...10]
    traffic.updateTraffic()
    console.log traffic.toString()
