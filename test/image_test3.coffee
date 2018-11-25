Image = require './../src/sensor_msgs/Image.coffee'
fs = require('fs')
PNG = require('pngjs').PNG

img = new Image.Image('../res/image/james.png')

png = new PNG(
  width: img.width
  height: img.height
  filterType: -1)

console.log(img.width + ", " + img.height)
console.log(png.width + ", " + png.height)

y = 0
while y < png.height
  x = 0
  while x < png.width
    idx = (png.width * y + x) << 2
    #png.data[idx]     = 255
    #png.data[idx + 1] = 0
    #png.data[idx + 2] = 0
    #png.data[idx + 3] = 255

    #png.data[idx]     = img.data[idx]
    #png.data[idx + 1] = img.data[idx + 1]
    #png.data[idx + 2] = img.data[idx + 2]
    #png.data[idx + 3] = img.data[idx + 3]

    color = img.getAt(x, y)
    png.data[idx]     = img.getAt(x, y).r
    png.data[idx + 1] = img.getAt(x, y).g
    png.data[idx + 2] = img.getAt(x, y).b
    png.data[idx + 3] = img.getAt(x, y).a
    #console.log(png.data[idx] + ", " + png.data[idx+1] + ", " + png.data[idx+2] + ", " + png.data[idx+3])

    x++
  y++
png.pack().pipe fs.createWriteStream('newOut.png')

img.saveAsync('async_save.png')