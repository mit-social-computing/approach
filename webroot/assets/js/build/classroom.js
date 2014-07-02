'use strict';

define(['jquery'],
function($) {
    var stage, message, veil

    function setup() {
        message.parentElement.removeChild(message)
        stage.classList.remove('is-intro')
        stage.insertBefore(veil, document.getElementById('1'))
    }

    function enter(e) {
        /*jshint validthis:true*/
        var targetLayer = this.hash
        $('.classroom-layer--section:not(' + targetLayer + ')').addClass('fade-out')
    }

    function exit(e) {
        $('.classroom-layer--section').removeClass('fade-out')
    }

    return {
        init : function() {
            message = document.getElementById('message')
            stage = document.getElementById('classStage')
            veil = document.getElementById('blackLayer')

            window.timer = setTimeout(setup, 1000)

            $('.icon').hover(enter, exit)
            $('.icon').click(function(e) { e.preventDefault() })
        }
    }
})
