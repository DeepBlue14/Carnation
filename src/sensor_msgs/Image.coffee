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
        @height = @png.height
        @width = @png.width


    saveAsync: (filename) ->
        @png.pack().pipe(fs.createWriteStream(filename)).on 'finish', ->
            console.log 'Written!'
            return
        # https://github.com/lukeapage/pngjs/blob/master/examples/newfile.js






#
if typeof module != "undefined" && module.exports
    # on a server
    exports.Image = Image
else
    # on a client
    window.Image = Image

