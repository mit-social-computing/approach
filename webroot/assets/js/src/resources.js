/*global Isotope,imagesLoaded,s,sessionStorage*/
'use strict';

define(['isotope', 'imagesloaded'],
function(Isotope, imagesLoaded) {
    var resources = document.getElementById('resourcesGrid'),
        filters = document.getElementById('filters'),
        tags = document.getElementById('resourceTags'),
        iso = new Isotope(resources, {
            itemSelector : '.thumb',
            layoutMode : 'masonry',
            masonry : {
                columnWidth: 275,
                gutter : 13,
                isFitWidth : true
            }
        }).on('layoutComplete', function() {
            try {
                s.refresh()
            } catch(e) {}
        }),
        imgWatcher,
        filterStore = {}

    console.log(tags)

    function updateHistory( filters ) {
        if ( window.history && window.sessionStorage ) {
            window.history.pushState({ filter : filters }, '')
            sessionStorage.setItem('filter', filters)
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
                if ( newFilters.indexOf(el.dataset.filter) !== -1 ) {
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
            var f = e.target.dataset.filter === '*' ? '*' : '.' + e.target.dataset.filter
            if ( e.target.classList.contains('selected') && filter === '*' ) {
                return
            } else {
                var addOrRemove = e.target.classList.toggle('selected')
                // ".for-teachers"
                filter(f, addOrRemove)
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

    if ( window.history && window.sessionStorage ) {
        var filterButtons = document.querySelectorAll('.filter'),
            state = window.history.state

        Array.prototype.forEach.call(filterButtons, function(b) {
            var f
            if ( b.dataset.filter !== '*' ) {
                f = '.' + b.dataset.filter
            } else {
                f = '*'
            }
            filterStore[f] = false
        })

        if ( state || sessionStorage.getItem('filter') ) {
            if ( state ) {
                state = state.filter
            } else {
                state = sessionStorage.getItem('filter')
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
            sessionStorage.setItem('filter', '*')
            filterStore['*'] = true
        }
    }
})
