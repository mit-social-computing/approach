/*global describe,it*/
'use strict';
define(['app/allpages'], function(lib) {
    var forEach = Array.prototype.forEach

    describe('page init', function() {
        var logo = document.createElement('h1'),
            newLogo
        logo.innerHTML = 'wildflower montessori'
        newLogo = lib.colorInit(logo)

        describe('colorInit', function() {

            it('should return a new H1 with proper attributes', function() {
                expect(newLogo.nodeName).toBe('H1')
                expect(newLogo.className).toBe('logo')
                expect(newLogo.id).toBe('logo')
            })

            it('should wrap a span with a color style around each letter', function() {
                forEach.call(newLogo.children, function(el) {
                    expect(el.nodeName).toBe('SPAN')
                    expect(el.style.color).not.toBe('')
                })
            })

            it ('should create a span for each letter, but not whitespace', function() {
                var chars = []
                forEach.call(logo.innerHTML, function(c) {
                    if ( c !== ' ' ) {
                        chars.push(c)
                    }
                })
                expect(chars.length).toEqual(newLogo.children.length)
            })
        })

        describe('updateLogoColors', function() {
            var startColors = [],
                newColors = []

            forEach.call(newLogo.children, function(el) {
                startColors.push(el.style.color)
            })
            lib.updateLogoColors(newLogo)
            forEach.call(newLogo.children,function(el) {
                newColors.push(el.style.color)
            })
            it('should change the declared color styles', function() {
                expect(startColors).not.toEqual(newColors)
            })
        })
    })
})
