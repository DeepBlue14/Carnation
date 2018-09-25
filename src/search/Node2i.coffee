##
#
#
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
