##
#
#
##

class AstarSearch
    @costmap
    @startXy
    @goalXy

    constructor: (@costmap, @startXy, @goalXy) ->


    run: (startXy, goalXy) ->
        if startXy.x < 0 || startXy.x >= @costmap.cols || startXy.y < 0 || startXy.y > @costmap.rows ||\
           goalXy.x < 0 || goalXy.x >= @costmap.cols || goalXy.y < 0 || goalXy.y > @costmap.rows
            console.log "ERROR: start or goal pos exeeds image bounds -- bye!"
            console.log "map (x, y): (" + @costmap.rows + ", " + @costmap.cols + ")"
            console.log "(" + startXy.x + ", " + startXy.y + ") ==> (" + goalXy.x + ", " + goalXy.y + ")"









#
if typeof module != "undefined" && module.exports
# on a server
    exports.AstarSearch = AstarSearch
else
# on a client
    window.AstarSearch = AstarSearch

