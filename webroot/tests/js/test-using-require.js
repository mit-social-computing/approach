'use strict';

require.config({
    baseUrl : '../../assets/js/build',
    paths : {
        jquery : 'lib/vendor/jquery',
        underscore : 'lib/underscore/underscore.min',
        foundation : 'lib/foundation/foundation',
    },
    shim : {
        'jquery': {
            exports: '$'
        },
        'foundation' : {
            deps : ['jquery']
        },
    }
})

require([
    'tests/specific-test.js'
    ],
    function() {
        QUnit.start()
    }
)
