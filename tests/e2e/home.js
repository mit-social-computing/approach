'use strict';

module.exports = {
    "home page" : function( browser ) {
        browser
            .url("http://approach.dev")
            .pause(6000)
            .elements('css selector', '.principles-text a', function(res) {
                this.assert.equal(res.value.length, 9)

                res.value.forEach(function(obj, idx) {
                    var i = parseInt(idx, 10) + 1
                    browser.moveTo(obj.ELEMENT)
                    browser.assert.visible('.jsgif:nth-child(' + i + ') canvas')
                })
            })
            .end()
    }
}
