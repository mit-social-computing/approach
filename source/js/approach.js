'use strict';

$(function() {
    $('#slideshow').slick({
        dots : true,
        draggable : false,
        infinite : false,
        onInit : function() {
            $('body').append( $('<div/>').addClass('slide-dots') )
            $('.slick-dots').appendTo('.slide-dots')
            $('.slick-prev').prependTo('#slideshow')
            $('.grid').on('click', '.grid-item', function(e) {
                e.preventDefault()
                var idx = $('.grid').children().index(this)
                $('#slideshow').slickGoTo(idx+1)
            })
        },
        vertical : true,
        customPaging : function(slick, idx) {
            var name
            if ( idx === 0 ) {
                name = 'index'
            } else {
                name = slick.$slides.eq(idx).find('.title').text()
            }
            return '<button class="slide-button" type="button"></button><span>' + name + '</span>'
        }
    })
})
