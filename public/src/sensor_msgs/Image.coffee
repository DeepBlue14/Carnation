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
        @dataf = fs.readFileSync(filename)
        @png  = PNG.sync.read(@dataf, filterType: -1)
        @data = @png.data
        @width = @png.width
        @height = @png.height
        @cols = @png.height
        @rows = @png.width


    zeros: () ->
        y = 0
        while y < this.height
            x = 0
            while x < this.width
                color = this.getAt(x, y)
                this.setAt2(x, y, 0, 0, 0, 255)
                x++
            y++


    getAt: (x, y) ->
        idx = this.index2OneD(x, y)
        #color = [{r: @data[idx]},
        #         {g: @data[idx+1]},
        #         {b: @data[idx+2]},
        #         {a: @data[idx+3]}]
        color = {
            r: @data[idx],
            g: @data[idx+1],
            b: @data[idx+2],
            a: @data[idx+3]
        }
        return color


    setAt1: (x, y, color) ->
        idx = this.index2OneD(x, y)
        @data[idx] = color.r
        @data[idx+1] = color.g
        @data[idx+2] = color.b
        @data[idx+3] = color.a


    setAt2: (x, y, r, g, b, a=255) ->
        color = {
            r: r,
            g: g,
            b: b,
            a: a
        }
        this.setAt1(x, y, color)


    # check of a pixel is free space or if it is "closed" space (i.e. part of a wall or other obstacle)
    isFreeSpace: (x, y) ->
        #TODO: implement
        return true

    index2OneD: (x, y) ->
        return (@width * y + x) << 2


    index2TwoD: (i) ->
        xy = {
            x: i % @width,
            y: i / @width
        }
        return xy


    saveAsync: (filename) ->
        tmp = new PNG(
            width: @png.width
            height: @png.height
            filterType: -1)
        console.log(tmp.width + ", " + tmp.height)

        y = 0
        while y < tmp.height
            x = 0
            while x < tmp.width
                idx = (tmp.width * y + x) << 2

                tmp.data[idx]     = @data[idx]
                tmp.data[idx + 1] = @data[idx + 1]
                tmp.data[idx + 2] = @data[idx + 2]
                tmp.data[idx + 3] = @data[idx + 3]
                x++
            y++
        tmp.pack().pipe fs.createWriteStream(filename).on 'finish', ->
            console.log 'Written!'
            return
        #@png.pack().pipe fs.createWriteStream(filename).on 'finish', ->
        #    console.log 'Written!'
        #    return


    toString: ->
        return 'Method stub'




#
if typeof module != "undefined" && module.exports
    # on a server
    exports.Image = Image
else
    # on a client
    window.Image = Image

