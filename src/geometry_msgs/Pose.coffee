##
# File: Pose.coffee
# Author: James Kuczynski <jkuczyns@cs.uml.edu>
# File Description: A pose in 3D space.
#
# Last modified: 10/01/2018
##

Point      = require './Point.coffee'
Quaternion = require './Quaternion.coffee'

class Pose
    @position    = new Point.Point(0.0, 0.0, 0.0)
    @orientation = new Quaternion.Quaternion(0.0, 0.0, 0.0, 0.0)

    constructor: (px, py, pz, ox, oy, oz, ow) ->
        @position    = new Point.Point(px, py, pz)
        @orientation = new Quaternion.Quaternion(ox, oy, oz, ow)

    #constructor: (@position, @orientation) ->


#
if typeof module != "undefined" && module.exports
    # on a server
    exports.Pose = Pose
else
    # on a client
    window.Pose = Pose

