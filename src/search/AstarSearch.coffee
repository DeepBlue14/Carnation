##
# File:   AstarSearch.coffee
# Author: James Kuczynski <jkuczyns@cs.uml.edu>
# File Description: A-star (A*) search algorithm
#
# Last Modified: 10/16/2018
#
##

class AstarSearch extends SearchAbc
    @costmap
    @closedmap
    @openmap
    @scanvas
    @smask
    @DOUBLE_MAX
    @DOUBLE_MIN
    @useDebugMode
    @isFirstTime
    @lastNode

    constructor: (@costmap, @startXy, @goalXy) ->


    run: (startXy, goalXy) ->
        if startXy.x < 0 || startXy.x >= @costmap.cols || startXy.y < 0 || startXy.y > @costmap.rows ||\
           goalXy.x < 0 || goalXy.x >= @costmap.cols || goalXy.y < 0 || goalXy.y > @costmap.rows
            console.log "ERROR: start or goal pos exeeds image bounds -- bye!"
            console.log "map (x, y): (" + @costmap.rows + ", " + @costmap.cols + ")"
            console.log "(" + startXy.x + ", " + startXy.y + ") ==> (" + goalXy.x + ", " + goalXy.y + ")"


    getMask: ->
        return @smask


    displayImage: (windowName, image, useWaitKey, waitKey, x, y) ->
        #


    toString: ->
        str = '--------AstarSearch--------'
        str.append('\nnodes:=' + lastNode.childCount)
        str.append('\npixel cost:=' + lastNode.pixSum)
        str.append('\nnorth:=' + lastNode.twist.nCout)
        str.append('\nsouth:=' + lastNode.twist.sCount)
        str.append('\neast:=' + lastNode.twist.eCount)
        str.append('\nwest:=' + lastNode.twist.wCount)
        str.append('\nnorth-east:=' + lastNode.twist.neCount)
        str.append('\nnorth-west:=' + lastNode.twist.nwCount)
        str.append('\nsouth-east:=' + lastNode.twist.seCount)
        str.append('\nsouth-west:=' + lastNode.twist.swCount)
        str.append('\n---------------------------\\n')

        return str


    generateNode: (x, y, direction, channel, parent) ->
        node = SearchNode(x, y, direction, channel, parent)
        node.pix = @costmap.at(x, y)[channel] / 10
        if parent is null
            node.pixSum = node.pix
        else if parent.pixSum + node.pix < DOUBLE_MAX-1
            node.pixSum = parent.pixSum + node.pix
        else
            ndoe.pixSum = DOUBLE_MAX-10

        return node


    getSuccessors: (node) ->
        for i in [0...successorLst.size]
            successorLst[i].g = q.g + calcLinearDistance(successorLst[i], q)
            successorLst[i].h = calcManhattenDistance(successorLst[i], goal)
            successorLst[i].f = successorLst[i].g + successorLst[i].h + successorLst[i].pixSum

            if successorLst[i].x is goal.x && successorLst[i].y is goal.y
                lastNode = successorLst[i].clone()
                if @useDebugMode
                    console.log('Found goal -- Bye!')
                    console.log(toString() )
                    #displayPath(successorLst[i])

            updateMask(lastNode)

            #TODO: openLst


    display: (openLst, closedLst, start, goal) ->
        #


    display: (lastNode, openLst, closedLst, start, goal) ->
        #


    updateMask: (lastNode) ->
        #




#
if typeof module != "undefined" && module.exports
# on a server
    exports.AstarSearch = AstarSearch
else
# on a client
    window.AstarSearch = AstarSearch

