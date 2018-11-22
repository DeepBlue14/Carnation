##
#
#
##

Image = require './../src/sensor_msgs/Image.coffee'
fs = require('fs')
PNG = require('pngjs').PNG

img = new Image.Image('../res/image/james.png')

console.log '@height ' + img.png.height + ' @width ' + img.png.width
###
#y = 0
#while y < img.png.height
#    x = 0
#    while x < img.png.width
#        idx = img.png.width * y + x << 2
#        # invert color
#        img.data[idx] = 255 - (img.data[idx])
#        img.data[idx + 1] = 255 - (img.data[idx + 1])
#        img.data[idx + 2] = 255 - (img.data[idx + 2])
#        # and reduce opacity
#        img.data[idx + 3] = img.data[idx + 3] >> 1
#        x++
#    y++

png2 = new PNG(
        width:img.png.width
        height:img.png.height
        filterType: -1)
for y in [0...image.png.height]
    for x in [0...img.png.width]
        idx = (img.png.width * y + x) << 2
        png2.data[idx] = 255 - (img.data[idx])
        png2.data[idx + 1] = 255 - (img.data[idx + 1])
        png2.data[idx + 2] = 255 - (img.data[idx + 2])
        # and reduce opacity
        png2.data[idx + 3] = img.data[idx + 3] >> 1
        
###

png2.pack().pipefs.createWriteStream('newOut.png')
#img.saveAsync("result.png")
