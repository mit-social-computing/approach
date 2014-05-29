/*global _,skrollr,imagesLoaded,FastClick,Modernizr*/
'use strict';
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
    s


function colorInit(banner) {
    var newH1 = document.createElement('h1')

    Array.prototype.forEach.call(banner.innerHTML, function(el, idx) {
        if ( el === ' ' ) {
            newH1.innerHTML += ' '
        } else {
            var span = document.createElement('span')
            span.innerHTML = el
            span.style.color = 'rgb(' + _.sample(colors) + ')'

            span.dataset.start = 'color: ' + span.style.color
            span.dataset._center = 'color: rgb(' + _.sample(colors) + ');'
            span.dataset.end = 'color: rgb(' + _.sample(colors) + ');'

            newH1.appendChild(span)
        }
    })

    newH1.id = 'logo'
    newH1.classList.add('logo')
    return newH1
}

logo.parentElement.replaceChild(colorInit(logo), logo)

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
        if ( !result && !document.getElementsByClassName('overview').length ) {
            imagesLoaded('img', function() {
                s = skrollr.init({
                    constants : {
                        _center : (document.documentElement.scrollHeight - window.innerHeight) / 2
                    }
                })
            })
        }
    }
})
