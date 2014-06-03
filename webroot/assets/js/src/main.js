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
    var path = document.location.pathname
    lib.init()

    if ( path === "/" ) {
        require(['app/home'])
    }

    if ( path.match(/resources/) && path.split('/').length === 2 ) {
        require(['app/resources'])
    }

})
