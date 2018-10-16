##
# File:   Vector3.coffee
# Author: James Kuczynski <jkuczyns@cs.uml.edu>
# File Description: Array with 3 indices.
#
# Last modified: 10/01/2018
##

class Vector3
    @x = 0.0
    @y = 0.0
    @z = 0.0

    constructor: (@x, @y, @z) ->



#
if typeof module != "undefined" && module.exports
    # on a server
    exports.Vector3 = Vector3
else
    # on a client
    window.Vector3 = Vector3

