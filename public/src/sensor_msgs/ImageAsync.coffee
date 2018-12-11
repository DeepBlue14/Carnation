fs = require('fs')
PNG = require('pngjs').PNG


class Image
    @header = 'null'
    @height = 66
    @done = false
    
    constructor: (filename) ->
        @header = filename
        fs.createReadStream(filename).pipe(new PNG(filterType: 4)).on( 'parsed', ->
            y = 0
            console.log '@height ' + @height
            while y < @height
                x = 0
                while x < @width
                    idx = @width * y + x << 2
                    # invert color
                    @data[idx] = 255 - (@data[idx])
                    @data[idx + 1] = 255 - (@data[idx + 1])
                    @data[idx + 2] = 255 - (@data[idx + 2])
                    # and reduce opacity
                    @data[idx + 3] = @data[idx + 3] >> 1
                    x++
                y++
            @pack().pipe fs.createWriteStream('out.png')
        ).on 'end', ->
            console.log 'done'
            @done = true
            return




#
if typeof module != "undefined" && module.exports
    # on a server
    exports.Image = Image
else
    # on a client
    window.Image = Image

