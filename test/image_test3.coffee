Image = require './../src/sensor_msgs/Image.coffee'
fs = require('fs')
PNG = require('pngjs').PNG

img = new Image.Image('../res/image/james.png')

png = new PNG(
  width: img.png.width
  height: img.png.height
  filterType: -1)
y = 0
while y < png.height
  x = 0
  while x < png.width
    idx = png.width * y + x << 2
    #png.data[idx]     = 255
    #png.data[idx + 1] = 0
    #png.data[idx + 2] = 0
    #png.data[idx + 3] = 255
    png.data[idx]     = img.data[idx]
    png.data[idx + 1] = img.data[idx + 1]
    png.data[idx + 2] = img.data[idx + 2]
    png.data[idx + 3] = 255 #img.data[idx + 3]
    x++
  y++
png.pack().pipe fs.createWriteStream('newOut.png')
