// forms.js
'use strict';

if ( path.match(/^\/contact/) ) {
    // var viewerHeight = 0

    // $('#viewer').children().each(function() {
    //     var h = $(this).outerHeight(true)
    //     if ( h > viewerHeight ) {
    //         viewerHeight = h
    //     }
    // }).end().height(viewerHeight)

    $('#viewer').find('form').submit(function(e) {
        e.preventDefault()

        var values = $(this).serialize(),
            action = this.action

        $.post(action, values, function(res, msg, promise) {
            var text
            if (res.success) {
                if ( $(this).parents('#contact_form') ) {
                    text = 'Your note has been sent.'
                } else {
                    text = 'You have signed up to be notified of upcoming info sessions.'
                }

                $(this).find('.success-box')
                    .addClass('show')
                    .height(25)
                    .text(text)
                    .siblings().hide()
            } else {
                var $errors = $(this).find('.errors-list')

                $errors.empty()
                Object.keys(res.errors).forEach(function(key) {
                    $errors.append($('<li/>', {
                        text: key.replace('_', ' ') + ' is required'
                    }))
                })

                $(this).find('.errors-box')
                    .height($errors.height() + 15)
                    .addClass('show')
            }
        }.bind(this))
    })
}
