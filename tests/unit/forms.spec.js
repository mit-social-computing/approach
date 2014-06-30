/*global describe,it,beforeEach*/
'use strict';
define(['app/forms', 'jquery'], function(lib, $) {
    //var forEach = Array.prototype.forEach,
    var $name, $age, $city, $state, $zip, $country, $email, $teacher, $parent,
        $form = $('<form/>')

    describe('form validation', function() {
        beforeEach(function(){
            $name = $('<input name="fullName" type="text">').appendTo($form).val('example')
            $age = $('<input name="age" type="text">').appendTo($form).val('55')
            $city = $('<input name="city" type="text">').appendTo($form).val('new york')
            $state = $('<input name="state" type="text">').appendTo($form).val('NY')
            $zip = $('<input name="zip" type="text">').appendTo($form).val('11222')
            $country = $('<input name="country" type="text">').appendTo($form).val('USA')
            $email = $('<input name="email" type="email">').appendTo($form).val('example@example.com')
            $teacher = $('<input type="checkbox" name="role" value="teacher">').appendTo($form)
            $parent = $('<input type="checkbox" name="role" value="parent">').appendTo($form)
        })

        describe('getFormValues method', function() {
            it('should return all form values as an object', function() {
                var form = lib.getFormValues($form[0])
                for (var val in form) {
                    if ( form.hasOwnProperty(val) && (val !== 'teacher' && val !== 'parent') ) {
                        expect(form[val]).toEqual($form.find('input[name=' + val + ']').val())
                    }
                }
            })
        })

        describe('splitName method', function() {
            it('should split up a name into two segments', function() {
                var name = 'brian whitton'
                expect(lib.splitName(name)).toEqual(['brian', 'whitton'])
                name = 'this is-a-hyphenated-name'
                expect(lib.splitName(name)).toEqual(['this', 'is-a-hyphenated-name'])
                name = 'a name with many spaces'
                expect(lib.splitName(name)).toEqual(['a', 'name with many spaces'])
            })
        })
    })
})
