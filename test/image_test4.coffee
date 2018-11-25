# coffee image_test4.coffee ../res/image/james.png

fs = require('fs')
PNG = require('pngjs').PNG
png = new PNG(filterType: -1)
src = fs.createReadStream(process.argv[2])
dst = fs.createWriteStream(process.argv[3] or 'out.png')
png.on 'parsed', ->
  y = 0
  while y < png.height
    x = 0
    while x < png.width
      idx = png.width * y + x << 2
      if Math.abs(png.data[idx] - (png.data[idx + 1])) <= 1 and Math.abs(png.data[idx + 1] - (png.data[idx + 2])) <= 1
        png.data[idx] = png.data[idx + 1] = png.data[idx + 2]
      x++
    y++
  png.pack().pipe dst
  return
src.pipe png
