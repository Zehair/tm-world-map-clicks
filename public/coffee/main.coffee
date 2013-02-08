

jQuery ->
    content = $('#content')
    worldMapSVG = null
    windowTemp = null
    worldMapHeight = null
    worldMapWidth = null
    lands = null
    
    setContentDimensions = ->
        windowTemp = $(window)
        content.css(
            height: windowTemp.height()
            width: windowTemp.width()
        )
    
    scaleSvgToWindow = ->
        windowTemp = $(window)
        winHeight = windowTemp.height()
        winWidth = windowTemp.width()
        worldMapHeight = parseInt(  worldMapSVG.height() )
        worldMapWidth = parseInt(  worldMapSVG.width() )
        scale =   winHeight  / worldMapHeight
        worldMapSVG.css(
            height: winHeight * scale
        )
        console.log "scale", scale
        
    setContentDimensions()

    $(window).resize ->
        setContentDimensions()
        scaleSvgToWindow()
        
    initWorldMap = (svg) ->

        worldMapSVG = $('#svg1926').svg()
        timmer = setInterval(()->
            showRandomPoint()
        ,300)
        lands = $('.land')
        console.log 'lands', $( lands[randomFromInterval(0, lands.length)] ).svg()
        scaleSvgToWindow()


    $('#content').svg(
        loadURL: '../img/BlankMap-World6-Equirectangular.svg'
        onLoad: initWorldMap
        settings: {}
        initPath: '..img/'
    )

    randomFromInterval = (from, to) ->
        Math.floor Math.random() * (to - from + 1) + from

    showRandomPoint = ()->
        xCord = randomFromInterval(10, worldMapWidth)
        yCord = randomFromInterval(10, worldMapHeight)

        thisCircle = worldMapSVG.svg('get').circle(lands[randomFromInterval(0, lands.length)], 10, 10, 10, {fill: 'red'}) 
        setTimeout(()->
            worldMapSVG.svg('get').remove(thisCircle)
        ,500)

    

    # resetSize svg


    
    

    
    

