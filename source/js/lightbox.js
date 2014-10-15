'use strict';

// define(['jquery', 'slick'],
// function($) {
if ( path.split('/').length === 3 || path.match(/^\/blog/)) {
    var $bg, $close

    function keyHandler(e) {
        var key = e.which
        if ( key === 39 ) { // right arrow
            $('#slideshow').slickNext()
        } else if ( key === 37 ) { // left arrow
            $('#slideshow').slickPrev()
        } else if ( key === 27 ) { // excape key
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
                $slides = $(el.previousElementSibling).clone().removeClass('hidden').attr('id', 'slideshow')

            $bg = $('<div/>').addClass('lightbox-bg').append('<div class="lightbox-body"/>')
            $bg.find('.lightbox-body').append($slides)

            $close = $('<button></button>').addClass('lightbox-close').appendTo($bg)
            $close.attr('id', 'close')

            $('body').addClass('l-fixbody').append($bg)

            $('#slideshow').slick({
                responsive : [
                    {
                        breakpoint : 480,
                        settings: {
                            arrows : false
                        }
                    }
                ],
                onInit : function() {
                    $('.ss-content img').css('max-height', window.innerHeight - 190 + 'px')
                }
            })

            $(window).on('keyup', keyHandler)
        } else if ( e.target.id === 'close' ) {
            close()
        }
    }, true)

    var adjustImageHeight = _.debounce(function(e) {
        $('.ss-content img').css('max-height', window.innerHeight - 190 + 'px')
        console.log('hit')
    }, 100)
    $(window).on('resize', adjustImageHeight)

    imagesLoaded('#resources-detail', function(){
        $(this.elements).addClass('layout-image-is-visible')
    })
}
//})
