##
# File:   AstarSearch.coffee
# Author: James Kuczynski <jkuczyns@cs.uml.edu>
# File Description: A-star (A*) search algorithm
#
# Last Modified: 11/01/2018
#
##

Node2i     = require './Node2i.coffee'
SearchNode = require './SearchNode.coffee'
SearchAbc  = require './SearchAbc.coffee'
Image      = require './../sensor_msgs/Image.coffee'

class AstarSearch extends SearchAbc.SearchAbc
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

    ###
    # Initialize the search
    # @param costmap: The costmap for a given raster
    # @param startXy: The start position (no orientation)
    # @param goalXy: The goal position (no orientation) 
    ###
    constructor: (@costmap, @startXy, @goalXy) ->
        super(10.0, 10.0)

    run: (startXy, goalXy) ->
        # A*
        if startXy.x < 0 || startXy.x >= @costmap.cols || startXy.y < 0 || startXy.y > @costmap.rows ||\
           goalXy.x < 0 || goalXy.x >= @costmap.rows || goalXy.y < 0 || goalXy.y > @costmap.cols #goalXy.x < 0 || goalXy.x >= @costmap.cols || goalXy.y < 0 || goalXy.y > @costmap.rows
            console.log "ERROR: start or goal pos exeeds image bounds -- bye!"
            console.log "map (x, y): (" + @costmap.rows + ", " + @costmap.cols + ")"
            console.log "(" + startXy.x + ", " + startXy.y + ") ==> (" + goalXy.x + ", " + goalXy.y + ")"
            return
        
        #
        openLst = []
        start = new SearchNode.SearchNode(startXy.x, startXy.y, 0, 0, null)
        goal = new SearchNode.SearchNode(goalXy.x, goalXy.y, 0, 0, null)
        openLst.push(start)
        @closedmap = new Image.Image('/home/james/CsProjects/CxxProjects/Agdl/AgdlCv/res/maze_inverted.png')
        @closedmap.zeros()
        @openmap = new Image.Image('/home/james/CsProjects/CxxProjects/Agdl/AgdlCv/res/maze_inverted.png')
        @openmap.zeros()
        @openmap.setAt2(start.x, start.y, start.f+1.0, start.f+1.0, start.f+1.0)


        counter = 0
        while(openLst.length > 0 && counter++ < 400)
            q = new SearchNode.SearchNode()
            q = openLst.pop() #get last and remove
            @openmap.setAt2(q.x, q.y, 0.0, 0.0, 0.0)
            
            console.log "(" + q.x + ", " + q.y + "): q.pixSum: " + q.pixSum + " q.pix: " + q.pix
            
            successorLst = this.getSuccessors(q)
            #console.log "looping \"for\" " + successorLst.length + " successors"
            for i in [0...successorLst.length]
                successorLst[i].g = q.g + this.calcLinearDistance(successorLst[i], q)
                successorLst[i].h = this.calcManhattenDistance(successorLst[i], goal)
                successorLst[i].f = successorLst[i].g + successorLst[i].h + successorLst[i].pixSum #FIXME: or ...->pix ???

                # TODO: Allow off-by-one check because of the diagonal and dual-linear-step method
                if successorLst[i].x is goal.x && successorLst[i].y is goal.y
                    lastNode = successorLst[i].clone()
                    if @useDebugMode
                        console.log('Found goal -- Bye!')
                        console.log(toString() )
                        #displayPath(successorLst[i])

                    this.updateMask(lastNode)

                    openLst = []
                    #deallocateAll()
                    return
                
                
                foundMatch = false
                if @openmap.getAt(successorLst[i].x, successorLst[i].y).r <= successorLst[i].f && @openmap.getAt(successorLst[i].x, successorLst[i].y).r > 0.0
                    foundMatch = true
                if foundMatch == false
                    if @closedmap.getAt(successorLst[i].x, successorLst[i].y).r <= successorLst[i].f && @closedmap.getAt(successorLst[i].x, successorLst[i].y).r > 0
                        foundMatch = true
            
                if foundMatch != true
                    openLst.push(successorLst[i])
                    if successorLst[i].f > 0.0
                        @openmap.setAt2(successorLst[i].x, successorLst[i].y, successorLst[i].f, successorLst[i].f, successorLst[i].f)
                    else
                        @openmap.setAt2(successorLst[i].x, successorLst[i].y, 1, 1, 1)
                #else
                #    console.log "Match found; we are done!?!"

            if q.f > 0.0
                @closedmap.setAt2(q.x, q.y, q.f, q.f, q.f)
            else
                @closedmap.setAt2(q.x, q.y, 1.0, 1.0, 1.0)

            successorLst = []    
        #end of while(...)


        ###
        fs = require('fs')
        obj = JSON.parse(fs.readFileSync('./path.json', 'utf8'))
        #console.log(obj)
        for idx, val of obj.path
            console.log val.y + ", " + val.x
            @costmap.setAt2(val.y, val.x, 100, 0, 100)
        ###
        @costmap.saveAsync('AAAcostmap.png')
        @openmap.saveAsync('AAAopenmap.png')
        @closedmap.saveAsync('AAAclosedmap.png')

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


    getSuccessors: (node) ->
        successors = []
        #console.log "node:=" + node
        successors.push(this.generateNode(node.x + 1, node.y - 1, 3, 3, node) )
        if node.x > 5 && node.x < (@costmap.cols-5) && node.y > 5 && node.y < (@costmap.rows-5)
            successors.push(this.generateNode(node.x + 1, node.y - 1, 3, 3, node) )
            successors.push(this.generateNode(node.x - 1, node.y + 1, 4, 4, node) )
            successors.push(this.generateNode(node.x + 1, node.y + 1, 2, 2, node) )
            successors.push(this.generateNode(node.x - 1, node.y - 1, 1, 1, node) )

        return successors


    generateNode: (x, y, direction, channel, parent) ->
        node = new SearchNode.SearchNode(x, y, direction, channel, parent)
        node.pix = @costmap.getAt(x, y).r / 10  #old: r ==> [channel]
        #console.log "x:= " + x + " y:= " + y +  " pix:= " + node.pix
        if parent is null
            node.pixSum = node.pix
        else if parent.pixSum + node.pix < 256-1
            node.pixSum = parent.pixSum + node.pix
        else
            node.pixSum = 256-10

        return node


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

