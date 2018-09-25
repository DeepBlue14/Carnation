##
#
# 
##

class Point
    @x = 0.0
    @y = 0.0
    @z = 0.0

    constructor: (@x, @y, @z) ->



#
if typeof module != "undefined" && module.exports
    # on a server
    exports.Point = Point
else
    # on a client
    window.Point = Point

