// forms.js
'use strict';

if ( path.match(/^\/schools/) ) {
    var viewerHeight = 0

    $('#viewer').children().each(function() {
        var h = $(this).outerHeight(true)
        if ( h > viewerHeight ) {
            viewerHeight = h
        }
    }).end().height(viewerHeight)

    $('#viewer').find('form').submit(function(e) {
        e.preventDefault()

        var values = $(this).serialize(),
            action = this.action

        $.post(action, values, function(res, msg, promise) {
            if (res.success) {
                $('#successBox')
                    .addClass('show')
                    .text('success. thank you.')
                    .siblings().hide()
            } else {
                var $errors = $('#errors')

                $errors.empty()
                Object.keys(res.errors).forEach(function(key) {
                    $errors.append($('<li/>', {
                        text: key.replace('_', ' ') + ' is required'
                    }))
                })

                $('#errorsBox')
                    .height($errors.height() + 15)
                    .addClass('show')
            }
        })
    })
}
