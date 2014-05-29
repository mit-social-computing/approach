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
    imgWatcher,
    filterStore = {}

function updateHistory( filters ) {
    if ( window.history ) {
        window.history.pushState({ filter : filters }, '')
        document.cookie = 'filter=' + filters
    }
}

function updateFilters( filterChoice, addSwitch ) {
    var filters,
        selected,
        filterString = '',
        f

    if ( filterChoice === '*' ) {
        filterString = '*'
        for ( f  in filterStore ) {
            filterStore[f] = false
        }
        filterStore['*'] = true
    } else {
        filterStore['*'] = false
        filterStore[filterChoice] = addSwitch
        for ( f in filterStore ) {
            filterString += filterStore[f] ? f : ''
        }
    }

    return filterString ? filterString : '*'
}

function setFilterButtons( filterString ) {
    var newFilters, filters,
        selected,
        //viewAll = document.getElementById('viewAll')
        viewAll = document.querySelector('.filter:first-child')

    if ( filterString === '*' ) {
        selected = document.querySelectorAll('.filter.selected')

        Array.prototype.forEach.call(selected, function(el) {
            if ( el.dataset.filter !== '*' ) {
                el.classList.remove('selected')
            }
        })

        viewAll.classList.add('selected')
    } else {
        viewAll.classList.remove('selected')
        filters = document.querySelectorAll('.filter')
        newFilters = filterString.split('.').slice(1)

        Array.prototype.forEach.call(filters, function(el) {
            if ( newFilters.indexOf(el.dataset.filter.slice(1)) !== -1 ) {
                el.classList.add('selected')
            } else {
                el.classList.remove('selected')
            }
        })
    }
}

function filter( filterChoice, addOrRemove ) {
    // filterChoice
    // .filter
    var filterString = updateFilters(filterChoice, addOrRemove)

    // filters
    // ".filter" or ".filter1.filter2"
    setFilterButtons(filterString)
    updateHistory(filterString)

    iso.arrange({
        filter : filterString
    })
}

imgWatcher = imagesLoaded(resources)

imgWatcher.on('progress', function(il, img) {
    img.img.classList.add('loaded')
})

filters.addEventListener('click', function (e) {
    if ( e.target.nodeName === 'BUTTON' ) {
        if ( e.target.classList.contains('selected') && e.target.dataset.filter === '*' ) {
            return
        } else {
            var addOrRemove = e.target.classList.toggle('selected')
            // ".for-teachers"
            filter(e.target.dataset.filter, addOrRemove)
        }
    }
})

window.addEventListener('popstate', function() {
    if ( history.state && history.state.filter ) {
        iso.arrange({
            filter : history.state.filter
        })
        // ".for-parents.for-teachers.for-researchers"
        setFilterButtons(history.state.filter)
    }
})

window.addEventListener('DOMContentLoaded', function() {
    if ( window.history ) {
        var filterButtons = document.querySelectorAll('.filter'),
            state = window.history.state

        Array.prototype.forEach.call(filterButtons, function(b) {
            filterStore[b.dataset.filter] = false
        })

        if ( state || document.cookie.match('filter') ) {
            if ( state ) {
                state = state.filter
            } else {
                state = document.cookie.match(/filter=(.*)/)[1]
            }
            state.split('.').slice(1).forEach(function(f) {
                updateFilters('.' + f, true)
            })
            iso.arrange({
                filter : state
            })
            // ".for-parents.for-teachers.for-researchers"
            setFilterButtons(state)
        } else {
            window.history.replaceState({ filter: '*' }, '')
            document.cookie = 'filter=*'
            filterStore['*'] = true
        }
    }
})
