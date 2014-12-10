// forms.js
'use strict';

// define(['jquery'],
// function($) {
if ( path.match(/^\/schools/) ) {
    var viewerHeight = 0

    function splitName(fullName) {
        var firstLast = []
        firstLast[0] = fullName.split(' ')[0]
        firstLast[1] = fullName.split(' ').slice(1).join(' ')
        return firstLast
    }

    function getFormValues(form) {
        var els = {}
        forEach.call(form.elements, function(el, idx) {
            if (el.type === 'checkbox') {
                els[el.value] = el.checked
            } else if (el.type !== 'submit') {
                els[el.name] = el.value
            }
        })
        return els
    }

    function sendForm(e) {
        e.preventDefault()

        var f = e.target,
            vals = getFormValues(f),
            firstLast = splitName(vals.fullName)

        vals.firstName = firstLast[0]
        vals.lastName = firstLast[1]
        console.log(JSON.stringify(vals))
    }

    $('#viewer').children().each(function() {
        var h = $(this).outerHeight(true)
        if ( h > viewerHeight ) {
            viewerHeight = h
        }
    }).end().height(viewerHeight)
}

//    return {
//        getFormValues : getFormValues,
//        splitName : splitName,
//        sendForm : sendForm
//    }
//})
