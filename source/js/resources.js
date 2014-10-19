/*global Isotope,imagesLoaded,s,sessionStorage*/
'use strict';

// define(['isotope', 'imagesloaded'],
// function(Isotope, imagesLoaded) {
if ( path.match(/^\/resources/) ) {
    if ( path.split('/').length === 2 ) {

        var resources = document.getElementById('resourcesGrid'),
            filters = document.getElementById('filters'),
            iOps = {
                transitionDuration : '0',
                itemSelector : '.grid-item',
                layoutMode : 'masonry',
                masonry : {
                    columnWidth: 275,
                    gutter : 13,
                    isFitWidth : true
                }
            },
            iso,
            imgWatcher,
            filterStore = {}, f,
            forEach = Array.prototype.forEach


        function filterInit() {
            var tpl = '<li><button class="filter"></button></li>',
                $container = $('<div/>').html(tpl),
                filters = []

            $('.grid-item').each(function() {
                var classes = $(this).attr('class').split(' ')
                classes.forEach(function(c, i) {
                    if ( !c.match(/grid-item|loaded/) && filters.indexOf(c) === -1 ) {
                        filters.push(c)
                    }
                })
            })

            filters.forEach(function(filter, i) {
                var $filter = $($container.html())
                $filter.find('.filter').attr('data-filter', filter).html(filter.replace('-', ' '))
                filters[i] = $filter
            })

            $('#filters').append(filters)
        }

        function updateHistory( filters ) {
            if ( window.history && window.sessionStorage ) {
                // filters stored in sessionStorage and state
                // as dot delimited strings that start with a dot as well
                // e.g. .for-parents.research
                window.history.pushState({ filter : filters }, '')
                sessionStorage.setItem('filter', filters)
            }
        }

        function updateFilters( filterChoice, addSwitch ) {
            // filterChoice
            // for-parents

            var selected = [],
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
                    if ( filterStore[f] ) {
                        selected.push(f)
                    }
                }
            }

            return selected.length ? '.' + selected.join('.') : '*'
        }

        function setFilterButtons( filterString ) {
            // filterString
            // ".for-parents.for-teachers.for-researchers"
            // launching with just one active filter at a time; radio vs checkbox
            // filterString
            // ".filter"
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
            //    viewAll.classList.remove('selected')
                filters = document.querySelectorAll('.filter')
                newFilters = filterString.split('.').slice(1)

                forEach.call(filters, function(el) {
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
            // launching with only one filter choice; radio button vs checkbox
            // for-parents
            // var filterString = updateFilters(filterChoice, addOrRemove)
            var filterString = filterChoice === '*' ? '*' : '.' + filterChoice

            // filters
            // ".filter" or ".filter1.filter2"
            setFilterButtons(filterString)
            updateHistory(filterString)

            iso.arrange({
                transitionDuration : '250ms',
                filter : filterString
            })
        }

        filters.addEventListener('click', function (e) {
            if ( e.target.nodeName === 'BUTTON' ) {
                var f = e.target.dataset.filter === '*' ? '*' : e.target.dataset.filter

                if ( e.target.classList.contains('selected') && filter === '*' ) {
                    return
                } else {
                    var addOrRemove = e.target.classList.toggle('selected')
                    // e.g. f = "for-teachers"
                    filter(f, addOrRemove)
                }
            }
        })

        window.addEventListener('popstate', function() {
            if ( history.state && history.state.filter ) {
                var f = history.state.filter
                iso.arrange({
                    filter : f,
                    transitionDuration : '250ms'
                })
                // ".for-parents.for-teachers.for-researchers"
                setFilterButtons(f)
                if ( window.sessionStorage ) {
                    sessionStorage.setItem('filter', f)
                }
            }
        })


        iso = new Isotope(resources, iOps).on('layoutComplete', function() {
            $('html, body').animate({scrollTop: 0}, 200)
            try {
                s.refresh()
            } catch(e) {}
        })

        if ( window.history && window.sessionStorage ) {
            f = sessionStorage.getItem('filter')
            if ( f && f !== '*' ) {
                iso.arrange({
                    filter : f
                })
            }
        }

        imgWatcher = imagesLoaded(resources)

        imgWatcher.on('progress', function(il, i) {
            i.img.parentElement.classList.add('loaded')
        })

        if ( window.history && window.sessionStorage ) {
            var filterButtons = document.querySelectorAll('.filter'),
                state = window.history.state

            forEach.call(filterButtons, function(b) {
                var f
                if ( b.dataset.filter !== '*' ) {
                    f = b.dataset.filter
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
                    history.replaceState({ filter : state }, '')
                }
                state.split('.').slice(1).forEach(function(f) {
                    updateFilters(f, true)
                })
                // ".for-parents.for-teachers.for-researchers"
                // launching with just one active filter; radio vs checkbox
                // ".for-parents"
                setFilterButtons(state)
            } else {
                history.replaceState({ filter: '*' }, '')
                sessionStorage.setItem('filter', '*')
                filterStore['*'] = true
            }
        }
    }

    filterInit()
}

//    return iso
//})
