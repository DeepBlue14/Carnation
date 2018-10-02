##
# File: Accel.coffee
# Author: James Kuczynski <jkuczyns@cs.uml.edu>
# File Description: Acceleration.
#
# Last modified: 10/01/2018
##

Vector3 = require './Vector3.coffee'

class Accel
    @linear  = new Vector3.Vector3(0.0, 0.0, 0.0)
    @angular = new Vector3.Vector3(0.0, 0.0, 0.0)

    constructor: (lx, ly, lz, ax, ay, az) ->
        @linear  = new Vector3.Vector3(lx, ly, lz)
        @angular = new Vector3.Vector3(ax, ay, az)

    #constructor: (@linear, @angular) ->


#
if typeof module != "undefined" && module.exports
    # on a server
    exports.Accel = Accel
else
    # on a client
    window.Accel = Accel

