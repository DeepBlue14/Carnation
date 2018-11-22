###
# File:   Image.coffee
# Author: James Kuczynski
# File Description: Contains the Image class.
# Ref: https://github.com/lukeapage/pngjs/tree/master/examples
# Last Modified: 10/02/2018
###

fs = require('fs')
PNG = require('pngjs').PNG


class Image
    @header = 'null'
    @done = false
    
    constructor: (filename) ->
        @data = fs.readFileSync(filename)
        @png  = PNG.sync.read(@data, filterType: -1)
        @cols = @png.height
        @rows = @png.width


    at: (x, y) ->
        #@data[]

        #while y < @height
        #    x = 0
        #    while x < @width
        #        idx = @width * y + x << 2
        #        # invert color
        #        @data[idx] = 255 - (@data[idx])
        #        @data[idx + 1] = 255 - (@data[idx + 1])
        #        @data[idx + 2] = 255 - (@data[idx + 2])
        #        # and reduce opacity
        #        @data[idx + 3] = @data[idx + 3] >> 1
        #        x++
        #    y++
        return @data[index2OneD(x, y)]


    # check of a pixel is free space or if it is "closed" space (i.e. part of a wall or other obstacle)
    isFreeSpace: (x, y) ->
        #TODO: implement
        return true

    index2OneD: (x, y) ->
        return x + @width*y


    index2TwoD: (i) ->
        xy = [{x: i % @width},
              {y: i / @width}]
        return xy


    saveAsync: (filename) ->
        @png.pack().pipe(fs.createWriteStream(filename)).on 'finish', ->
            console.log 'Written!'
            return
        # https://github.com/lukeapage/pngjs/blob/master/examples/newfile.js


    toString: ->
        return 'Method stub'




#
if typeof module != "undefined" && module.exports
    # on a server
    exports.Image = Image
else
    # on a client
    window.Image = Image

