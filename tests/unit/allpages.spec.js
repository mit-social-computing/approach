/*global describe,it,beforeEach,afterEach*/
'use strict';
define(['app/allpages'], function(lib) {
    var forEach = Array.prototype.forEach,
        logo = document.createElement('h1'),
        newLogo = document.createElement('h1')

    logo.innerHTML = 'wildflower montessori'

    function setup(el) {
        var span = document.createElement('span')
        span.innerHTML = el
        newLogo.appendChild(span)
    }

    describe('page init', function() {

        beforeEach(function() {
            forEach.call(logo.innerHTML, setup)
            forEach.call(newLogo.children, lib.colorInit)
        })
        afterEach(function() {
            newLogo = document.createElement('h1')
        })

        describe('colorInit', function() {

            it('should have elements equal to one less than the base text', function() {
                expect(newLogo.children.length).toEqual(logo.innerHTML.length)
            })
            it('should add an inline color declaration', function(){
                forEach.call(newLogo.children, function(el){
                    expect(el.style.color).not.toBe('')
                })
            })
            it('should add skrollr attributes', function(){
                forEach.call(newLogo.children, function(el) {
                    expect(el.dataset.start).toBeDefined()
                    expect(el.dataset._center).toBeDefined()
                    expect(el.dataset.end).toBeDefined()
                })
            })
        })

        describe('staggerLoad', function() {
            it ('should add a random set of transition delays to each span', function() {
                var copy = newLogo.cloneNode(true),
                    copyTransitions = [],
                    originalTransitions = []

                expect(copy.childElementCount).toEqual(newLogo.childElementCount)
                lib.staggerLoad(copy)
                lib.staggerLoad(newLogo)
                forEach.call([copy, newLogo], function(l, i) {
                    forEach.call(l.children, function(span) {
                        if ( i === 0 ) {
                            copyTransitions.push(span.style.webkitTransitionDelay)
                        } else {
                            originalTransitions.push(span.style.webkitTransitionDelay)
                        }
                    })
                })
                expect(copyTransitions).not.toEqual(originalTransitions)
            })
        })

    })
})
