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
    @canvas
    @mask
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
        #


    displayImage: (windowName, image, useWaitKey, waitKey, x, y) ->
        #


    toString: ->
        #


    generateNode: (x, y, direction, channel, parent) ->
        #


    getSuccessors: (node) ->
        #


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

