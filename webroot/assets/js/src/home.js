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
    if ( key === 'authentic' ) {
        img.onload = function (e) {
            stage.appendChild(this)
            this.classList.add('show')
        }
    }
})

principles.addEventListener('mouseenter', function(e) {
    if ( e.target.nodeName === 'A' ) {
        var gif
        try {
            gif = e.target.hash.substr(1)
            stage.removeChild(stage.firstChild)
        } catch(err) {}
        finally {
            stage.appendChild(gifs[gif])
            gifs[gif].classList.add('show')
        }
    }
}, true)

principles.addEventListener('mouseleave', function(e) {
    if ( e.target.nodeName === 'A' ) {
        var gif = e.target.hash.substr(1)
        gifs[gif].classList.remove('show')

        try {
            stage.removeChild(stage.firstChild)
        } catch(err) {}
    }
}, true)
