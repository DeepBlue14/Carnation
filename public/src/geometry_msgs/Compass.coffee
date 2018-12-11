

class Compass
    @nCount # turned north
    @sCount # turned south
    @eCount # turned east
    @wCount # turned west
    @compassScore # score the turn stuff on a scale of [0.0, 1.0]


    score: ->
        return (@nCount + @sCount + @eCount + @wCount) / 100.0