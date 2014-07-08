'use strict';

define([ 'exports', 'libgif', 'app/allpages', 'imagesloaded', 'jquery' ],
function( exports, SuperGif, lib, imagesLoaded, $ ) {
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
        stage = document.getElementById('gifStage'),
        iL = imagesLoaded('#initGif')

    function removeDisabled(gif) {
        var href = '#' + gif.id,
            anchor = document.querySelector('a[href="' + href +'"]')

        anchor.classList.remove('disabled')
    }

    function canvasInit() {
        Object.keys(gifs).forEach(function(gif){
            gifs[gif] = new SuperGif({
                gif : document.getElementById(gif),
                auto_play : 0,
                max_width: 559
            })
            gifs[gif].load(removeDisabled)
        })
    }

    principles.addEventListener('mouseover', function(e) {
        if ( e.target.nodeName === 'A' && !e.target.classList.contains('disabled') ) {
            var logo = document.getElementById('logo')
            lib.updateLogoColors(logo)

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

    principles.addEventListener('click', function(e) {
        e.preventDefault()
    }, false)

    return {
        iL : iL,
        c : canvasInit
    }

})
