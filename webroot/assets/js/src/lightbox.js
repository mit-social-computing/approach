'use strict';

define(['jquery', 'slick'],
function($) {
    var $bg, $close

    document.addEventListener('click', function(e){
        if (e.target.classList.contains('lightbox')) {
            e.preventDefault()
            var el = e.target,
                $slides = $(el.previousElementSibling).clone().removeClass('hidden').attr('id', 'slideshow')

            $bg = $('<div/>').addClass('lightbox-bg').append('<div class="lightbox-body"/>')
            $bg.find('.lightbox-body').append($slides)

            $close = $('<button>X</button>').addClass('lightbox-close').appendTo($bg)
            $close.attr('id', 'close')

            $('body').addClass('lightbox-fixbody').append($bg)
            $('#slideshow').slick()
        } else if ( e.target.id === 'close' ) {
            $bg.remove()
            $('body').removeClass('lightbox-fixbody')
            $bg = null
        }
    }, false)
})
