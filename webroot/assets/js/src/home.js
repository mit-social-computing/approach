'use strict';

var principles = document.getElementById('principles'),
    gifs = {
        'adults' : undefined
        , 'authentic' : undefined
        , 'dots' : undefined
        , 'everyone' : undefined
        , 'everyone2' : undefined
        , 'materials' : undefined
        , 'nature' : undefined
        , 'network' : undefined
        , 'research' : undefined
        , 'storefront' : undefined
    },
    gifTemp = '/assets/img/gifs/{{gif}}.gif',
    stage = document.getElementById('gifStage')

Object.keys(gifs).forEach(function(key) {
    var img = document.createElement('img')
    img.src = gifTemp.replace('{{gif}}', key)
    gifs[key] = img
})

principles.addEventListener('mouseenter', function(e) {
    if ( e.target.nodeName === 'A' ) {
        try {
            var gif = e.target.hash.substr(1)
            stage.appendChild(gifs[gif])
            gifs[gif].classList.add('show')
        } catch(err) {}
    }
}, true)
principles.addEventListener('mouseleave', function(e) {
    if ( e.target.nodeName === 'A' ) {
        try {
            var gif = e.target.hash.substr(1)
            gifs[gif].classList.remove('show')

            // sync to transition duration in CSS
            setTimeout(function() {
                stage.removeChild(stage.firstChild)
            }, 150)
        } catch(err) {}
    }

}, true)
