Image        = require './../src/sensor_msgs/Image.coffee'
Node2i       = require './../src/search/Node2i.coffee'
SearchNode   = require './../src/search/SearchNode.coffee'
SearchAbc    = require './../src/search/SearchAbc.coffee'
AstarSearch  = require './../src/search/AstarSearch.coffee'
fs  = require('fs')
PNG = require('pngjs').PNG

img1 = new Image.Image('/home/james/CsProjects/CxxProjects/Agdl/AgdlCv/res/maze_inverted.png')
startPt = new Node2i.Node2i(25, 25)
goalPt  = new Node2i.Node2i(1110, 1150)
search  = new AstarSearch.AstarSearch(img1, startPt, goalPt)

n = new SearchNode.SearchNode(startPt.x, startPt.y, 0, 0, null)
n.x = 0
console.log "n.x: " + n.x

search.run(startPt, goalPt)

console.log "Done!"
