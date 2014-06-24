'use strict';

var filters,
    thumbs

module.exports = {
    'get filters' : function(browser) {
        browser
            .url('http://approach.dev/resources')
            .elements('css selector', '.filter', function(res) {
                filters = res.value
                filters.forEach(function(obj, i) {
                    i++
                    browser.getAttribute('.filters li:nth-child(' + i + ') button', 'data-filter', function(filter) {
                        filters[i-1].filter = filter.value
                    })
                })
            })
    },
    'get thumbnails' : function(browser) {
        browser.elements('css selector', '.thumb', function(res) {
            thumbs = res.value
            thumbs.forEach(function(obj, i) {
                i++
                browser.getAttribute('.thumb:nth-of-type(' + i + ')', 'class', function(className) {
                    thumbs[i-1].className = className.value
                })
            })
        })
    },
    'test' : function(browser) {
        filters.forEach(function(filter, i) {
            if (i !== 0) {
                i++
                browser.click('button[data-filter=' + filter.filter + ']').pause(500)
                thumbs.forEach(function(thumb, j) {
                    j++
                    if (thumb.className.indexOf(filter.filter) === -1) {
                        browser.assert.hidden('.thumb:nth-of-type(' + j + ')')
                    } else {
                        browser.assert.visible('.thumb:nth-of-type(' + j + ')')
                    }
                })
                browser.click('.filters li:nth-child(1) button').assert.visible('.thumb')
            }
        })
        browser.end()
    }
}
