jQuery ->
    winWidth = $(window).width()
    winHeight = $(window).height()
    theWorld = Pablo( '#svg2' )
    
    theWorld.attr("viewBox", "0 0 " + winWidth + " " + winHeight )
    
    newScale = 'scale('+ winHeight / 533 + ')'
    theWorld.children('#world').attr("transform", newScale )
    theWorld.children('#clip').attr("transform", newScale );

    getRandomInt =(min, max)-> 
        Math.floor(Math.random() * (max - min + 1)) + min;

    
    flashLand = (switcher)->
        
        if switcher is 'one'
            winHeightReduction = winHeight / 6
            cx = getRandomInt(100, winWidth )
            cy = getRandomInt( winHeightReduction, ( winHeight - winHeightReduction ) )

        if switcher is 'two'
            winWidthReduction = winWidth / 6
            cx = getRandomInt(100, winWidth )
            cy = getRandomInt( winWidthReduction, ( winWidth - winWidthReduction ) )

        if switcher is 'three'
            winHeightReduction = winHeight / 6
            cx = getRandomInt(100, winHeight )
            cy = getRandomInt( winHeightReduction, ( winHeight - winHeightReduction ) )
        
        circle = theWorld.circle({cx:cx, cy:cy, r:3, fill:'#f1111d', 'clip-path':'url(#clip)'})

        timmer2 = setTimeout( ()->
            circle.remove()
        ,1000)

    
    setInterval(->
        flashLand('one')
        flashLand('two')
        flashLand('three')
    ,20)

