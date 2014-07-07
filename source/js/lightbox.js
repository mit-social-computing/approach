'use strict';

define(['jquery', 'slick'],
function($) {
    var $bg, $close

    function keyHandler(e) {
        var key = e.which
        if ( key === 39 ) { // right arrow 
            $('#slideshow').slickNext()
        } else if ( key === 37 ) {
            $('#slideshow').slickPrev()
        } else if ( key === 27 ) {
            close()
        }
    }

    function close() {
        $bg.remove()
        $('body').removeClass('l-fixbody')
        $('window').off('keyup', keyHandler)
    }

    document.addEventListener('click', function(e){
        if (e.target.classList.contains('is-lightbox')) {
            e.preventDefault()
            var el = e.target,
                $slides = $(el.parentElement.previousElementSibling).clone().removeClass('hidden').attr('id', 'slideshow')

            $bg = $('<div/>').addClass('lightbox-bg').append('<div class="lightbox-body"/>')
            $bg.find('.lightbox-body').append($slides)

            $close = $('<button>X</button>').addClass('lightbox-close').appendTo($bg)
            $close.attr('id', 'close')

            $('body').addClass('l-fixbody').append($bg)
            $('#slideshow').slick()
            $(window).on('keyup', keyHandler)
        } else if ( e.target.id === 'close' ) {
            close()
        }
    }, true)
})