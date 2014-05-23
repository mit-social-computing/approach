/*global _*/
'use strict';

var colors = [
        'teal'
        , 'dark-yellow'
        , 'light-yellow'
        , 'pink'
        , 'green'
    ]

function swapText(banner) {
    var newH1 = document.createElement('h1')

    Array.prototype.forEach.call(banner.innerHTML, function(el, idx) {
        var span = document.createElement('span')
        span.innerHTML = el
        span.class  = _.sample(colors)
        newH1.appendChild(span)
    })

    return newH1
}

function colorInit(banner) {
    if (banner.children.length < 2) { return }
    var spans = Array.prototype.slice.call(banner.children, 0),
        animateThese = _.sample(spans, 4),
        theseColors = _.sample(colors, 4)

    animateThese.forEach(function(el, idx) {
        el.style.color = theseColors[idx]
    })

    setTimeout(function() {
        colorInit(banner)
    }, 1000)
}
