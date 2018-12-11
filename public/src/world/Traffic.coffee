##
# File:   Traffic.coffee
# Author: James Kuczynski <jkuczyns@cs.uml.edu>
# File Description: Simulate traffic (i.e. people in the halls, etc.).
#                   Traffic congestion varies depending on whether it is a
#                   weekday/weekend, and what time of day it is.
#
# Last Modified: 11/03/2018
##

class Traffic
    constructor: (@costmap) ->
        date = new Date()
        day = date.getDay()
        hours = date.getHours()

        console.log day
        console.log hours

        if day == 0 or day == 6
            dayMult = 2
        else
            dayMult = 1

        hoursMult = hours
        if hours > 12
            for i in [1...hours-12]
                hoursMult--

        #console.log "dayMult: " + dayMult
        #console.log "hoursMult: " + hoursMult
        @numObstacles = hoursMult*dayMult
        @obstacles = []


    generateUniform: ->
        count = 0
        numThrows = 0
        while count < @numObstacles
            obs = @throwDice()
            console.log("Generated: " + obs.x + ", " + obs.y)
            if @costmap.isFreeSpace(obs.x, obs.y) #check that obs isn't in a wall
                @obstacles.push(obs)
                count++
            if numThrows > 100
                break; # risking out of mem crash
            #console.log(@numObstacles + " <> " + count)


    # at each traffic update, each person will move [-4, 4] meters up/down and left/right
    updateTraffic: ->
        for obs in @obstacles
            isUpdated = false
            numThrows = 0
            while isUpdated == false
                x = Math.floor(Math.random() * 8) - 4
                y = Math.floor(Math.random() * 8) - 4
                if @costmap.isFreeSpace(obs.x, obs.y) #check that obs isn't in a wall
                    obs.x += x
                    obs.y += y
                    isUpdated = true
                numThrows++
                if numThrows > 100
                    break; # don't try to update a particle indenfinitely


    # helper function to generate random position
    throwDice: ->
        obs = {
            x: Math.floor(Math.random() * @costmap.rows)
            y: Math.floor(Math.random() * @costmap.cols)
        }

        return obs


    toString: ->
        str = "---------- Traffic ----------\n"
        for obs in @obstacles
            str += (obs.x + ", " + obs.y + "\n")

        str += "---------- Traffic ----------\n"
        return str




#
if typeof module != "undefined" && module.exports
# on a server
    exports.Traffic = Traffic
else
# on a client
    window.Traffic = Traffic

