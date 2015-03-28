// approach.js
/*global Modernizr*/
'use strict';

$(function() {
    var slickOps = {
        slide : '.slide',
        dots : true,
        draggable : false,
        infinite : false,
        onInit : function(Slick) {
            $('.slick-dots').appendTo('.slide-dots')
            $('.slick-prev').prependTo('#slideshow')
            $('.slick-next').addClass('slick-disabled')

            $('.grid').on('click', '.grid-item', function(e) {
                e.preventDefault()
                if ( $(this).find('a').hasClass('disabled') ) {
                    return false
                }
                var idx = $('.grid').children().index(this)
                $('#slideshow').slickGoTo(idx+1)
            })

            var count = 0

            Slick.gifs = {}

            $('.gif').each(function(img) {
                this.src = '/' + this.src.split('/').slice(3).join('/')

                var id = $(this).parents('.slide').attr('id'),
                    gif = new SuperGif({
                        gif : this,
                        auto_play : false
                    })

                gif.load(function(g){
                    var href = '#' + g.src.match(/\/([^/]+)\.gif$/)[1],
                        anchor = document.querySelector('a[href="' + href +'"]')
                    anchor.classList.remove('disabled')

                    if ( count === 8 ) {
                        $('#dots').removeClass('disabled')
                        $('.slick-next').removeClass('slick-disabled')
                    } else {
                        count++
                    }
                })
                Slick.gifs[id] = gif
            })
        },
        onAfterChange : function(Slick, idx) {
            if ( idx !== 0 ) {
                var id = Slick.$slides[idx].id

                $('.jsgif').addClass('hide')

                Object.keys(Slick.gifs).forEach(function(gif) {
                    Slick.gifs[gif].pause()
                })

                Slick.gifs[id].move_to(1)
                $('#' + id).find('.jsgif').removeClass('hide')
                Slick.gifs[id].play()
            }
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
    },
    mql

    $('.disabled').click(function(e) {
        e.preventDefault()
    })

    if ( matchMedia ) {
        mql = window.matchMedia('(min-width: 40em)')
        if ( !Modernizr.touch && mql.matches ) {
            $('#slideshow').slick(slickOps)
        }

        mql.addListener(function(mql) {
            if ( mql.matches ) {
                $('#slideshow').slick(slickOps)
            } else {
                $('#slideshow').unslick()
            }
        })
    }
})
