jQuery ->

    countries = ["fr","fx","gp","id","ye","mg","tw","mx","ae","bz","br","sl","it","bd","do","gw","se","tr","mz","jp","nz","cu","ve","pt","mr","ao","de","th","au","pg","hr","gl","g27049","dk","ir","mm","fi","sb","om","pa","ar","gb","gn","ie","ng","tn","tz","sa","vn","ru","ht","in","cn","ca","gq","az","my","ph","rs","me","ee","es","ga","kh","kr","hn","cl","nl","lk","gr","ec","no","lb","er","us","kz","lakes","aq","uz","nc","nc","fj","fj","kw","kw","tl","tl","bs","bs","g20657","vu","vu","fk","fk","gm","qa","jm","cy","pr","ps","ps","bn","bn","tt","tt","cv","cv","pf","pf","ws","ws","lu","km","km","mu","fo","fo","st","st","an","an","dm","to","to","ki","ki","fm","bh","ad","mp","pw","sc","ag","ag","bb","tc","tc","vc","lc","yt","vi","vi","gd","mt","mv","ky","kn","kn","ms","bl","nu","pm","ck","ck","wf","as","mh","aw","li","vg","vg","sh","je","ai","mf","gg","sm","bm","tv","nr","gi","pn","mc","va","im","gu","sg", "sd"]
    countryCount = countries.length

    randomLand = ()->
        aLand = getRandomInt(0, countryCount)
        countries[aLand]

    getRandomInt =(min, max)-> 
        Math.floor(Math.random() * (max - min + 1)) + min;

    
    flashLand = ()->
        landClass = "." + randomLand() 
        console.log 'landClass', landClass
        Pablo( landClass ).addClass('selected')
        timmer2 = setTimeout( ()->
            Pablo( landClass ).removeClass('selected')
        ,1000)

    
    setInterval(->
        flashLand() 
        console.log 'test'
    ,50)
