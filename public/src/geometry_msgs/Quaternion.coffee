##
# File:   Quaternion.coffee
# Author: James Kuczynski <jkuczyns@cs.uml.edu>
# File Description: A quaternion in 3D space.
#
# Last modified: 10/01/2018
##

class Quaternion
    @x = 0.0
    @y = 0.0
    @z = 0.0
    @w = 0.0

    constructor: (@x, @y, @z, @w) ->



#
if typeof module != "undefined" && module.exports
    # on a server
    exports.Quaternion = Quaternion
else
    # on a client
    window.Quaternion = Quaternion

