Image = require './../src/sensor_msgs/Image.coffee'
fs = require('fs')
PNG = require('pngjs').PNG

img1 = new Image.Image('../res/image/james.png')
img2 = new Image.Image('../res/image/blank.png')


y = 0
while y < img1.height
    x = 0
    while x < img1.width
        color = img1.getAt(x, y)
        #img2.setAt2(x, y, 255, 0, 0, 255)
        img2.setAt1(x, y, color)
        x++
    y++

img1.saveAsync('test5_1.png')
img2.saveAsync('test5_2.png')