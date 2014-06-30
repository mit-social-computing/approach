'use strict';

var filter = "for-parents",
    thumbs

module.exports = {
    'tag sets filter state' : function(browser) {
        browser
            .init()
            .waitForElementVisible('body', 1000)
            .click('#resourcesNav')
            .waitForElementVisible('body', 1000)
            .click('.thumb:first-of-type a')
            .waitForElementVisible('body', 1000)
            .click('.resource-tag[data-filter=' + filter + ']')
            .waitForElementVisible('body', 1000).pause(2000)
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
        thumbs.forEach(function(thumb, i) {
            i++
            if (thumb.className.indexOf(filter) === -1) {
                browser.assert.hidden('.thumb:nth-of-type(' + i + ')')
            } else {
                browser.assert.visible('.thumb:nth-of-type(' + i + ')')
            }
        })
        browser.end()
    }
}
