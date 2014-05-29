/*global SuperGif*/
'use strict';

var principles = document.getElementById('principles'),
    gifs = {
        'adults' : undefined
        , 'authentic' : undefined
        , 'dots' : undefined
        , 'everyone2' : undefined
        , 'materials' : undefined
        , 'nature' : undefined
        , 'network' : undefined
        , 'research' : undefined
        , 'storefront' : undefined
    },
    stage = document.getElementById('gifStage')

function removeDisabled(gif) {
    var href = '#' + gif.id,
        anchor = document.querySelector('a[href="' + href +'"]')

    anchor.classList.remove('disabled')
}

window.addEventListener('DOMContentLoaded', function() {
    setTimeout(function() {
        Object.keys(gifs).forEach(function(gif){
            gifs[gif] = new SuperGif({
                gif : document.getElementById(gif),
                auto_play : 0,
                c_h : 145
            })
            gifs[gif].load(removeDisabled)
        })
    }, 2250)
})

principles.addEventListener('mouseover', function(e) {
    if ( e.target.nodeName === 'A' && !e.target.classList.contains('disabled') ) {
        if (stage.children[0].id === 'initGif') {
            stage.removeChild(stage.children[0])
        }

        Object.keys(gifs).forEach(function(gif){
            gifs[gif].pause()
            gifs[gif].get_canvas().classList.remove('show')
        })

        gifs[e.target.hash.slice(1)].move_to(1)
        gifs[e.target.hash.slice(1)].get_canvas().classList.add('show')
        gifs[e.target.hash.slice(1)].play()
    }
}, true)

// principles.addEventListener('mouseleave', function(e) {
//     if ( e.target.nodeName === 'A' && !e.target.classList.contains('disabled') ) {
//         e.target.gif.get_canvas().classList.remove('show')
//         e.target.gif.pause()
//     }
// }, true)
