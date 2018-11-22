##########################################################################
# File:   AstarSearch.coffee
# Author: James Kuczynski <jkuczyns@cs.uml.edu>
# File Description: Abstract base class for search algorithms.
#
# Last Modified: 11/01/2018
#
##########################################################################

class SearchAbc
    @MAGIC_NUM_1
    @MAGIC_NUM_2

    ###
    # Initialize the class
    # @param MAGIC_NUM_1: Constant used in the heuristic
    # @param MAGIC_NUM_2: Constant used in the heuristic
    ###
    constructor: (@MAGIC_NUM_1, @MAGIC_NUM_2) ->


    minF: (lst) ->
        currMinIdx = 0
        currMinF = 1000000 #TODO: max(float)
        for value, i in lst
            if lst[i].f < currMinF
                currMinF = lst[i].f
                currMinIdx = i

        return currMinIdx


    calcRawDistance: (node1, node2) ->
        dx = Math.abs(node1.x - node2.x)
        dy = Math.abs(node1.y - node2.y)
        result = dx + dy

        return result


    calcLinearDistance: (node1, node2) ->
        dx = Math.abs(node1.x - node2.x)
        dy = Math.abs(node1.y - node2.y)
        result = (dx + dy) / 2.0

        return result


    calcManhattenDistance: (node1, node2) ->
        dx = Math.abs(node1.x - node2.x)
        dy = Math.abs(node1.y - node2.y)
        result = 0

        if dx > dy
            result = MAGIC_NUM_1 * dy + MAGIC_NUM_2 * (dx - dy)
        else
            result = MAGIC_NUM_1 * dx + MAGIC_NUM_2 * (dy - dx)

        return result


    calcDiagonalDistance: (node1, node2) ->
        dx = Math.abs(node1.x - node2.x)
        dy = Math.abs(node1.y - node2.y)
        result = 0

        if dx > dy
            result = (MAGIC_NUM_1 * (dx - dy) + MAGIC_NUM_2 * dy)
        else
            result = (MAGIC_NUM_1 * (dy - dx) + MAGIC_NUM_2 * dx)

        return result


    getSuccessors: (node) ->
        #

    display: (openLst, closedLst, start, goal) ->
        #

    display: (lastNode, openLst, closedLst, start, goal) ->
        #



#
if typeof module != "undefined" && module.exports
# on a server
    exports.SearchAbc = SearchAbc
else
# on a client
    window.SearchAbc = SearchAbc

