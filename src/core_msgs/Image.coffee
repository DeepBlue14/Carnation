###
#
#
# Ref: https://github.com/lukeapage/pngjs/tree/master/examples
#
###

fs = require('fs')
PNG = require('pngjs').PNG


class Image
    @header = 'null'
    @done = false
    
    constructor: (filename) ->
        @data = fs.readFileSync(filename)
        @png  = PNG.sync.read(@data, filterType: -1)
        
        ###
        console.log 'data ' + @data[0]
        y = 0
        console.log '@height ' + @png.height
        while y < @png.height
            x = 0
            while x < @png.width
                idx = @png.width * y + x << 2
                console.log 'data[' + idx + '] = ' + @data[idx]
                # invert color
                @data[idx] = 0
                x++
            y++
        ###
        c = 0
        while c < @png.width * @png.height
            #console.log 'data[' + c + '] = ' + @data[c]
            #if @data[c] > 100
            #    @data[c] = (@data[c]) - 100
            c++

        @png  = PNG.sync.read(@data, filterType: -1)
        buff = PNG.sync.write(@png)
        fs.writeFileSync 'output.png', buff
        
        @header = filename
        @done = true
        console.log 'Finished construction '







#
if typeof module != "undefined" && module.exports
    # on a server
    exports.Image = Image
else
    # on a client
    window.Image = Image

