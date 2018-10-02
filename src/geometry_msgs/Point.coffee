##
# File: Point.coffee
# Author: James Kuczynski <jkuczyns@cs.uml.edu>
# File Description: A point in 3D space.
#
# Last modified: 10/01/2018
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

