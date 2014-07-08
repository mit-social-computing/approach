'use strict';

define(['lodash', 'skrollr', 'imagesloaded', 'fastclick', 'modernizr', 'jquery'],
function(_, skrollr, imagesLoaded, FastClick, Modernizr) {
    var menuButton = document.getElementById('menuButton'),
        menu = document.getElementById('nav'),
        arrow = document.getElementById('arrow'),
        colors = {
            'teal' : [112, 190, 205]
            , 'dark-yellow' : [231, 181, 44]
            , 'light-yellow' : [255, 202, 43]
            , 'pink' : [247, 126, 133]
            , 'green' : [129, 174, 113]
        },
        logo = document.getElementById('logo'),
        forEach = Array.prototype.forEach

    function updateLogoColors(logo) {
        forEach.call(logo.children, function(span) {
            span.style.color = 'rgb(' + _.sample(colors) + ')'
        })
    }

    function colorInit( el, idx ) {
        if ( el !== ' ' ) {
            el.style.color = 'rgb(' + _.sample(colors) + ')'

            el.dataset.start = 'color: ' + el.style.color
            el.dataset._center = 'color: rgb(' + _.sample(colors) + ');'
            el.dataset.end = 'color: rgb(' + _.sample(colors) + ');'
        }
    }

    function staggerLoad(logo, home) {
        var chars = logo.children,
            starters = 0,
            DURATION = home ? 2500 : 800

        forEach.call(chars, function(span, i) {
            if ( starters < 2 && Math.random() < 0.5 ) {
                span.style.webkitTransitionDelay = '0ms'
                starters++
            } else if ( i === chars.length - 1 && starters === 0 ) {
                span.style.webkitTransitionDelay = '0ms'
            } else {
                span.style.webkitTransitionDelay = '0ms, ' + Math.floor(Math.random() * DURATION) + 'ms'
            }
        })
    }

    function init(home) {
        forEach.call(logo.children, colorInit)

        setTimeout(function() {
            logo.classList.add('loaded')
            staggerLoad(logo, home)
        }, 0)

        arrow.addEventListener('click', function (e) {
            e.preventDefault()
            $('html, body').animate({scrollTop: 0}, 200)
        }, false)

        window.addEventListener('load', function() {
            FastClick.attach(document.body);
        }, false);

        menuButton.addEventListener('click', function(e) {
            menu.classList.toggle('show')
        }, false)

        Modernizr.load({
            test: Modernizr.touch,
            nope : "/assets/bower_components/skrollr/dist/skrollr.min.js",
            callback : function( url, result, key ) {
                if ( !result &&
                    ( !document.getElementById('overview') && !document.getElementById('start-a-school') && !document.getElementById('contact') && !document.getElementById('classroom') )) {
                    imagesLoaded('img', function() {
                        window.s = skrollr.init({
                            constants : {
                                _center : (document.documentElement.scrollHeight - window.innerHeight) / 2
                            }
                        })
                    })
                }
            }
        })
    }

    return {
        init : init,
        colorInit: colorInit,
        staggerLoad : staggerLoad,
        updateLogoColors : updateLogoColors
    }
})
