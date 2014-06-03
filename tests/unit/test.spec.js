/*global describe,it*/
'use strict';
define(['app/allpages'], function(lib) {
    describe('sample test', function() {
        it('should return hello', function() {
            expect(lib.test()).toEqual('hello')
        })
    })
})
