'use strict';


module.exports = {
    "resources" : function(browser) {
        browser
            .url("http://approach.dev/resources")
            .pause(1000)
            .elements('css selector', '.filter', function(res) {
                for (var i = 1; i < res.value.length; i++) {
                    console.log('i', i)
                    if (i === 1) {
                        continue
                    } else {
                        browser.click('.filters li:nth-of-type(' + i + ') button')
                        browser.elements('css selector', '.thumb', function(thumbs) {
                            for (var j = 1; j < thumbs.value.length; j++) {
                                console.log('j', j)
                                browser.getAttribute('.thumb:nth-of-type(' + j + ')', 'class', function(className) {
                                    console.log('className', className.value)
                                    browser.getAttribute('.filters li:nth-of-type(' + i + ') button', 'data-filter', function(filter) {
                                        console.log('filter', filter.value)
                                        console.log(className.value.indexOf(filter.value.slice(1)))
                                        if (className.value.indexOf(filter.value.slice(1)) === -1) {
                                            browser.assert.hidden('.thumb:nth-of-type(' + j + ')')
                                        } else {
                                            browser.assert.visible('.thumb:nth-of-type(' + j + ')')
                                        }
                                    })
                                })
                            }
                        })
                    }
                    browser.click('.filters li:nth-of-type(1) button')
                }
            })
            .end()
    }
}
