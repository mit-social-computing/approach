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
        },
        "slick" : ['jquery']
    },
    paths: {
        app : "../js/build",
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
        //jquery : "../js/lib/jquery/animate-jquery",
        jquery : "../js/lib/jquery/jquery.min",
        libgif : "../js/lib/libgif/libgif",
        slick : "slick-carousel/slick/slick"
    },
    packages: [

    ]
});

requirejs(['app/allpages'],
function( lib ) {
    var path = document.location.pathname,
        tags

    if ( path !== '/' ) {
        lib.init()
    }

    if ( path === '/' ) {
        require(['app/home'], function(home) {
            home.iL.on('always', function (iL) {
                if ( iL.isComplete ) {
                    lib.init(true)
                    setTimeout(function() {
                        $('#nav').addClass('loaded')
                        setTimeout(function() {
                            $('#initGif').addClass('loaded')
                            setTimeout(function() {
                                $('#principles, #homeFooter').addClass('loaded')
                                home.c()
                            }, 2500)
                        }, 500)
                    }, 1600)
                }
            })
        })
    } else if ( path.match(/^\/resources/) ) {
        if ( path.split('/').length === 2 ) {
            require(['app/resources'])
        } else if ( path.split('/').length === 3 ) {
            require(['imagesloaded', 'app/lightbox'], function(imagesLoaded) {
                imagesLoaded('#resources-detail', function(){
                    $(this.elements).addClass('layout-image-is-visible')
                })
            })
            require(['app/lightbox'])
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
    } else if ( path.match(/^\/start-a-school/) ) {
        require(['app/forms'], function(lib) {
            var f = document.getElementById('startForm')
            f.addEventListener('submit', lib.sendForm, false)
        })
    } else if ( path.match(/^\/blog/) ) {
        require(['imagesloaded', 'app/lightbox'], function(imagesLoaded) {
            imagesLoaded('#blog', function(){
                $(this.elements).addClass('layout-image-is-visible')
            })
        })
    } else if ( path.match(/^\/classroom/) ) {
        require(['app/classroom'], function(classroom) {
            classroom.init()
        })
    }

})
