fs = require('fs')
PNG = require('pngjs').PNG
png = new PNG(
  width: 100
  height: 100
  filterType: -1)
y = 0
while y < png.height
  x = 0
  while x < png.width
    idx = png.width * y + x << 2
    png.data[idx]     = 255
    png.data[idx + 1] = 0
    png.data[idx + 2] = 0
    png.data[idx + 3] = 255
    x++
  y++
png.pack().pipe fs.createWriteStream('newOut.png')
