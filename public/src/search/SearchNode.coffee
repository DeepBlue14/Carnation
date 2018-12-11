##
# File:   SearchNode.coffee
# Author: James Kuczynski <jkuczyns@cs.uml.edu>
# File Description:
#
# Last Modified: 10/16/2018
#
##

Twist  = require './Twist.coffee'

class SearchNode

    Direction =
        NONE:       0
        NORTH:      1
        SOUTH:      2
        EAST:       3
        WEST:       4
        NORTH_WEST: 5
        NORTH_EAST: 6
        SOUTH_EAST: 7
        SOUTH_WEST: 8

    Channel =
        NONE:       0
        NORTH:      1
        SOUTH:      2
        EAST:       3
        WEST:       4
        NORTH_WEST: 5
        NORTH_EAST: 6
        SOUTH_EAST: 7
        SOUTH_WEST: 8

    @x
    @y
    @direction
    @channel
    @parent
    @childCount
    @g
    @h
    @f
    @pix
    @pixSum
    @compass


    constructor: (x = 0, y = 0, direction = Direction.NONE, channel = Channel.NONE, parent = null) ->
        @x = x
        @y = y
        @direction = direction
        @channel = channel
        @parent = parent
        @compass = new Twist.Twist()
        if parent?
            @pixSum = parent.pixSum
            @childCount = parent.childCount + 1
            @compass.nCount = parent.compass.nCount
            @compass.sCount = parent.compass.sCount
            @compass.eCount = parent.compass.eCount
            @compass.wCount = parent.compass.wCount
            @compass.neCount = parent.compass.neCount
            @compass.nwCount = parent.compass.nwCount
            @compass.seCount = parent.compass.seCount
            @compass.swCount = parent.compass.swCount

            switch @direction
                when @direction is Direction.NONE then null
                when @direction is Direction.NORTH then @compass.nCount++
                when @direction is Direction.SOUTH then @compass.sCount++
                when @direction is Direction.EAST then @compass.eCount++
                when @direction is Direction.WEST then @compass.wCount++
                when @direction is Direction.NORTH_EAST then @compass.neCount++
                when @direction is Direction.NORTH_WEST then @compass.nwCount++
                when @direction is Direction.SOUTH_EAST then @compass.seCount++
                when @direction is Direction.SOUTH_WEST then @compass.swCount++
                else console.log('') #console.log('ERROR: Unidentified enumeration in switch @SearchNode.constructor(...)')
        else
            @childCount = 0
            @compass.nCount = 0
            @compass.sCount = 0
            @compass.eCount = 0
            @compass.wCount = 0
            @compass.neCount = 0
            @compass.nwCount = 0
            @compass.seCount = 0
            @compass.swCount = 0
            @pixSum = 0.0

        #console.log "??? " + @x + " ???"
        @g = 0.0
        @h = 0.0
        @f = 0.0
        @pix = 0.0





#
if typeof module != "undefined" && module.exports
# on a server
    exports.SearchNode = SearchNode
else
# on a client
    window.SearchNode = SearchNode
