##
# File: Twist.coffee
# Author: James Kuczynski <jkuczyns@cs.uml.edu>
# File Description: 2D (x, y) point, i.e. pixel
##

class Twist
    @nCount
    @sCount
    @eCount
    @wCount
    @neCount
    @nwCount
    @seCount
    @swCount
    @twistScore

    constructor: () ->
    
    score: () ->
        #
        
        
        
#
if typeof module != "undefined" && module.exports
# on a server
    exports.Twist = Twist
else
# on a client
    window.Twist = Twist
