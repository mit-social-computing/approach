'use strict';

define(['lodash', 'skrollr', 'imagesloaded', 'fastclick', 'modernizr', 'jquery'],
function(_, skrollr, imagesLoaded, FastClick, Modernizr) {
    var menuButton = document.getElementById('menuButton'),
        menu = document.getElementById('nav'),
        arrow = document.getElementById('arrow'),
        resourcesLink = document.getElementById('resourcesNav'),
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
            DURATION = home ? 1800 : 800,
            d

        forEach.call(chars, function(span, i) {
            d = Math.floor(Math.random() * DURATION)
            if ( starters < 2 && Math.random() < 0.5 ) {
                span.style.webkitTransitionDelay = '0ms, 10ms'
                span.style.mozTransitionDelay = '0ms, 10ms'
                span.style.transitionDelay = '0ms, 10ms'
                starters++
            } else if ( i === chars.length - 1 && starters === 0 ) {
                span.style.webkitTransitionDelay = '0ms, 10ms'
                span.style.transitionDelay = '0ms, 10ms'
            } else {
                span.style.webkitTransitionDelay = '0ms, ' + ( d === 0 ? '50' : d ) + 'ms'
                span.style.transitionDelay = '0ms, ' + ( d === 0 ? '50' : d ) + 'ms'
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

        resourcesLink.addEventListener('click', function(e) {
            if ( window.sessionStorage && window.history ) {
                history.replaceState({ filter : '*' }, '')
                sessionStorage.clear()
            }
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
