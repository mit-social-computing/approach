/*global sessionStorage*/
'use strict';

require.config({
    baseUrl : "/assets/bower_components/",
    shim: {
        "libgif" : {
             exports : "SuperGif"
        },
        "modernizr" : {
            exports : "Modernizr"
        }
    },
    paths: {
        app : "../js/src",
        fastclick: "fastclick/lib/fastclick",
        foundation: "foundation/js/foundation",
        imagesloaded: "imagesloaded/imagesloaded.pkgd.min",
        item: "isotope/js/item",
        "layout-mode": "isotope/js/layout-mode",
        isotope: "isotope/dist/isotope.pkgd.min",
        //vertical: "isotope/js/layout-modes/vertical",
        "fit-rows": "isotope/js/layout-modes/fit-rows",
        //masonry: "isotope/js/layout-modes/masonry",
        //requirejs: "requirejs/require",
        skrollr: "skrollr/src/skrollr",
        modernizr : "../js/lib/modernizr/custom.modernizr",
        lodash : "../js/lib/lodash/lodash.min",
        jquery : "../js/lib/jquery/animate-jquery",
        libgif : "../js/lib/libgif/libgif",
    },
    packages: [

    ]
});

requirejs(['app/allpages'],
function( lib ) {
    var path = document.location.pathname,
        tags

    lib.init()

    if ( path === "/" ) {
        require(['app/home'])
    } else if ( path.match(/resources/) ) {
        if ( path.split('/').length === 2 ) {
            require(['app/resources'])
        } else if ( path.split('/').length === 3 ) {
            tags = document.getElementById('resourceTags')
            tags.addEventListener('click', function(e) {
                if ( e.target.nodeName === 'A' && window.sessionStorage ) {
                    // filters stored in sessionStorage and state
                    // as dot delimited strings that start with a dot as well
                    // e.g. .for-parents.research
                    sessionStorage.setItem('filter', '.' + e.target.dataset.filter)
                }
            }, false)
        }
    } else if ( path.match(/start-a-school/) ) {
        require(['app/forms'], function(lib) {
            var f = document.getElementById('startForm')
            f.addEventListener('submit', lib.sendForm, false)
        })
    }



})
