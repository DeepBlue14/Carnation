##
#
#
##

Image = require './../src/sensor_msgs/Image.coffee'

img = new Image.Image('../res/image/james.png')

console.log '@height ' + img.png.height + ' @width ' + img.png.width
###
y = 0
while y < img.png.height
    x = 0
    while x < img.png.width
        idx = img.png.width * y + x << 2
        # invert color
        img.data[idx] = 255 - (img.data[idx])
        img.data[idx + 1] = 255 - (img.data[idx + 1])
        img.data[idx + 2] = 255 - (img.data[idx + 2])
        # and reduce opacity
        img.data[idx + 3] = img.data[idx + 3] >> 1
        x++
    y++
###
