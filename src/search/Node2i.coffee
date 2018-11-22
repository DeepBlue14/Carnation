##
# File: Node2i.coffee
# Author: James Kuczynski <jkuczyns@cs.uml.edu>
# File Description: 2D (x, y) point, i.e. pixel
#
# Last Modified: 11/21/2018
##

class Node2i
    @x = 0.0
    @y = 0.0

    constructor: (@x, @y) ->


#
if typeof module != "undefined" && module.exports
# on a server
    exports.Node2i = Node2i
else
# on a client
    window.Node2i = Node2i
