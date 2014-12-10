//main.js
/*global sessionStorage*/
'use strict';

var menuButton = document.getElementById('menuButton'),
    menu = document.getElementById('nav'),
    arrow = document.getElementById('arrow'),
    resourcesLink = $('#nav-sub-2'),
    colors = {
        'teal' : [112, 190, 205]
        , 'dark-yellow' : [231, 181, 44]
        , 'light-yellow' : [255, 202, 43]
        , 'pink' : [247, 126, 133]
        , 'green' : [129, 174, 113]
    },
    logo = document.getElementById('logo'),
    forEach = Array.prototype.forEach,
    path = document.location.pathname,
    tags

function updateLogoColors(logo) {
    forEach.call(logo.children, function(span) {
        span.style.color = 'rgb(' + _.sample(colors) + ')'
    })
}

function colorInit( el, idx ) {
    if ( el !== ' ' ) {
        el.style.color = 'rgb(' + _.sample(colors) + ')'

        $(el).data('start', 'color: ' + el.style.color )
        $(el).data('_center', 'color: rgb(' + _.sample(colors) + ');')
        $(el).data('end', 'color: rgb(' + _.sample(colors) + ');')
    }
}

function staggerLoad(logo) {
    var chars = logo.children,
        starters = 0,
        DURATION = 800,
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

function subNavLoader(section) {
    $('#content').fadeOut().queue(function() {
      $(this).html( WF.sections[section] ).dequeue()
    }).fadeIn()
    $('#subnav li').removeClass('selected')
}

(function init() {
    forEach.call(logo.children, colorInit)

    setTimeout(function() {
        logo.classList.add('loaded')
        staggerLoad(logo)
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

    resourcesLink.click(function(e) {
        if ( window.sessionStorage && window.history ) {
            history.replaceState({ filter : '*' }, '')
            sessionStorage.clear()
        }
    })

    if ( !Modernizr.touch &&
          !document.getElementById('home') &&
          !document.getElementById('schools') &&
          !document.getElementById('principles') ) {
            imagesLoaded('img', function() {
                window.s = skrollr.init({
                    constants : {
                        _center : (document.documentElement.scrollHeight - window.innerHeight) / 2
                    }
                })
            })
    }
})()


if ( path === '/' ) {
    imagesLoaded('#homeImg', function() {
        $('#homeImg, .grid').addClass('loaded')
    })
} else if ( path.match(/^\/resources/) ) {
    if ( path.split('/').length === 3 ) {
        tags = document.getElementById('resourceTags')
        tags.addEventListener('click', function(e) {
            if ( e.target.nodeName === 'A' && window.sessionStorage ) {
                // filters stored in sessionStorage and state
                // as dot delimited strings that start with a dot as well
                // e.g. .for-parents.research
                sessionStorage.setItem('filter', '.' + $(e.target).data('filter'))
            }
        }, false)
    }
} else if ( path.match(/^\/schools/) ) {
    //var f = document.getElementById('startForm')
    //f.addEventListener('submit', sendForm, false)
    //$("form").submit(sendForm)
    $('a.panel').click(function(e) {
        e.preventDefault()
        var $this = $(this),
            idx = $this.index()

        $this.siblings().removeClass('selected')
        $this.addClass('selected')
        $('#viewer').children().eq(idx).addClass('selected')
        $('#viewer').children().eq(idx).siblings().removeClass('selected')

    })
    setTimeout(function() {
        $('a.panel').first().click()
    })
} else if ( path.match(/^\/blog/) ) {
    if ( path.split('/').length > 2 ) {
        imagesLoaded('#blog-detail', function(){
            $(this.elements).addClass('layout-image-is-visible')
        })
    } else {
        imagesLoaded('#blog', function(){
            $(this.elements).addClass('layout-image-is-visible')
        })
    }
} else if ( path.match(/^\/summary/) ) {
    if ( path.split('/').length < 3 ) {
        $('#subnav').find('li').first().addClass('selected')
    }

    $('#subnav').on('click', 'a', function(e) {
        e.preventDefault()
        var section = this.pathname.split('/').splice(-1).toString()
        window.history.pushState({ section : section },'', this.pathname)

        subNavLoader(section)

        $(this).parent().addClass('selected')
    })

    $(window).on('popstate', function(e) {
        var section
        if ( e.originalEvent.state && e.originalEvent.state.section ) {
            section = e.originalEvent.state.section
        } else {
            section = 'about'
        }

        subNavLoader(section)

        $('#subnav a').map(function() { 
            if ( this.innerHTML.toLowerCase() === section ) {
                return this
        } }).parent().addClass('selected')
    })
}
