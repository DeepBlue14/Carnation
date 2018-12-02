Image = require './../src/sensor_msgs/Image.coffee'
fs = require('fs')
PNG = require('pngjs').PNG

img1 = new Image.Image('../res/image/james.png')
img2 = new Image.Image('../res/image/blank.png')


y = 0
while y < img1.height
    x = 0
    while x < img1.width
        if x %% 2 == 0 or y %% 2 == 0
            img2.setAt1(x, y, img1.getAt(x, y) )
        else
            img2.setAt1(x, y,  {
            r: 255,
            g: 0,
            b: 0,
            a: 255})
        x++
    y++

img1.saveAsync('test6_1.png')
img2.saveAsync('test6_2.png')