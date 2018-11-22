##
# File:   SearchNode.coffee
# Author: James Kuczynski <jkuczyns@cs.uml.edu>
# File Description: Node class for searching over a matrix (image)
#
# Last Modified: 11/21/2018
#
##

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


    constructor: (@x = 0, @y = 0, @direction = Direction.NONE, @channel = Channel.NONE, @parent = null) ->
        if parent != null
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
                else console.log('ERROR: Unidentified enumeration in switch @SearchNode.constructor(...)')
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

        @g = 0.0
        @h = 0.0
        @f = 0.0
        @pix = 0.0

