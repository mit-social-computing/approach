/*global Isotope,imagesLoaded,s*/
'use strict';

var resources = document.getElementById('resourcesGrid'),
    filters = document.getElementById('filters'),
    iso = new Isotope(resources, {
        itemSelector : '.thumb',
        layoutMode : 'masonry',
        masonry : {
            columnWidth: 275,
            gutter : 13,
            isFitWidth : true
        }
    }).on('layoutComplete', function() {
        if (s) {
            s.refresh()
        }
    }),
    imgWatcher

function filter (filterChoice) {
    var selected = document.querySelectorAll('.filter.selected'),
        filters = '',
        viewAll

    if ( filterChoice === '*' ) {
        Array.prototype.forEach.call(selected, function(el) {
            if ( el.dataset.filter !== '*' ) {
                el.classList.remove('selected')
            }
        })
        filters = '*'
    } else {
        viewAll = document.querySelector('.filter:first-child')
        viewAll.classList.remove('selected')

        Array.prototype.forEach.call(selected, function(el) {
            filters += el.dataset.filter
        })
    }
    iso.arrange({
        filter : filters
    })
}

imgWatcher = imagesLoaded(resources)

imgWatcher.on('progress', function(il, img) {
    img.img.classList.add('loaded')
})

filters.addEventListener('click', function (e) {
    if ( e.target.nodeName === 'BUTTON' ) {
        e.target.classList.toggle('selected')
        filter(e.target.dataset.filter)
    }
})
