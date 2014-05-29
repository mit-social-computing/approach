/*global SuperGif*/
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
    stage = document.getElementById('gifStage'),
    principleText = document.getElementById('principles')

function removeDisabled(gif) {
    var href = '#' + gif.id,
        anchor = document.querySelector('a[href="' + href +'"]')

    anchor.classList.remove('disabled')
}

window.addEventListener('DOMContentLoaded', function() {
    Array.prototype.forEach.call(principleText.children, function(el) {
        el.gif = new SuperGif({
            gif : document.getElementById(el.hash.slice(1)),
            auto_play : 0,
            c_h : 145
        })
        el.gif.load(removeDisabled)
    })
})
// Object.keys(gifs).forEach(function(key) {
//     var img = document.createElement('img')
//     img.src = gifTemp.replace('{{gif}}', key)
//     gifs[key] = img
//     if ( key === 'authentic' ) {
//         img.onload = function (e) {
//             stage.appendChild(this)
//             this.classList.add('show')
//         }
//     }
// })

principles.addEventListener('mouseenter', function(e) {
    if ( e.target.nodeName === 'A' && !e.target.classList.contains('disabled') ) {
        e.target.gif.move_to(0)
        e.target.gif.get_canvas().classList.add('show')
        e.target.gif.play()
    }
}, true)

principles.addEventListener('mouseleave', function(e) {
    if ( e.target.nodeName === 'A' && !e.target.classList.contains('disabled') ) {
        e.target.gif.get_canvas().classList.remove('show')
        e.target.gif.pause()
    }
}, true)
