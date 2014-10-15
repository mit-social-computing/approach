'use strict'; 
module.exports = function(grunt) {

    var mainJs = [
         'source/bower_components/modernizr/modernizr.build.js'
        , 'source/js/lib/lodash/lodash.js'
        , 'source/bower_components/jquery/dist/jquery.js'
        , 'source/bower_components/slick-carousel/slick/slick.js'
        , 'source/bower_components/imagesloaded/imagesloaded.pkgd.js'
        , 'source/bower_components/isotope/dist/isotope.pkgd.js'
        , 'source/bower_components/fastclick/lib/fastclick.js'
        , 'source/js/main.js'
        , 'source/js/resources.js'
        , 'source/js/lightbox.js'
        , 'source/js/forms.js'
        , 'source/js/approach.js'
    ]

    // Project configuration.
    grunt.initConfig({

        shell : {
            nightwatch : {
                command : 'nightwatch -e chrome,default'
            }
        },

        watch : {
            options : {
                livereload : true
            },
            files : [
                'source/templates/**/*.html'
                , 'webroot/assets/js/scripts.min.js'
                , 'webroot/assets/css/style.min.css'
                , 'webroot/assets/css/style.concat.css'
            ],
            sass : {
                files : ['source/sass/**/*.scss'],
                tasks : ['compass']
            },
            autoprefixer : {
                files : ['webroot/assets/css/style.css'],
                tasks : ['autoprefixer:css']
            },
            css : {
                files : ['webroot/assets/css/style.fixed.css'],
                tasks : ['concat:css']
            },
            scripts : {
                files : ['source/js/**/*.js'],
                tasks : ['uglify:dev', 'concat:js']
            }
        },
        uglify : {
            dev : {
                options : {
                    sourceMap : true,
                    sourceMapIncludeSources : true,
                    compress : {
                        global_defs : {
                            "DEBUG" : true
                        }
                    }
                },
                files : {
                    'webroot/assets/js/scripts.min.js' : mainJs,
                }
            },
            build : {
                options : {
                    sourceMap : true,
                    sourceMapIncludeSources : true,
                    compess : {
                        drop_console : true,
                        global_defs : {
                            "DEBUG" : false
                        }
                    }
                },
                files : {
                    'webroot/assets/js/scripts.min.js' : mainJs,
                }
            }
        },
        compass : {
            dev : {
                options : {
                    config : "./config.rb"
                }
            }
        },
        autoprefixer : {
            options : {},
            css : {
                src : 'webroot/assets/css/style.css',
                dest : 'webroot/assets/css/style.fixed.css'
            }
        },
        modernizr : {
            dist : {
                devFile : 'source/bower_components/modernizr/modernizr.js',
                outputFile :  'source/bower_components/modernizr/modernizr.build.js',
                uglify : false,
                extra : {
                    shiv : false
                    //load : false
                },
                files : {
                    src : [
                        'source/js/**/*.js'
                        , 'source/sass/**/*.scss'
                        , '!source/sass/phase1/**/*.scss'
                    ]
                }
            }
        },
        cssmin : {
            build : {
                files : {
                    'webroot/assets/css/style.min.css' : 'webroot/assets/css/style.concat.css'
                },
                options : {
                    noAdvanced : true
                }
            }
        },
        concat : {
            css : {
                files :  {
                    'webroot/assets/css/style.concat.css' : [
                        'source/bower_components/slick-carousel/slick/slick.css'
                        , 'webroot/assets/css/style.fixed.css'
                    ]
                }
            },
            js : {
                files : {
                    'webroot/assets/js/scripts.concat.js' : mainJs,
                }
            }
        }
    })

    // These plugins provide necessary tasks.
    grunt.loadNpmTasks('grunt-contrib-concat');
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-contrib-compass');
    grunt.loadNpmTasks('grunt-contrib-cssmin')
    grunt.loadNpmTasks('grunt-modernizr')
    grunt.loadNpmTasks('grunt-autoprefixer')

    grunt.registerTask('default', ['watch'])
    grunt.registerTask('nightwatch', ['shell:nightwatch']);
    grunt.registerTask('build', [
        'modernizr'
        , 'uglify:build'
        , 'compass'
        , 'autoprefixer:css'
        , 'concat:css'
        , 'cssmin:build'
    ])
    grunt.registerTask('css', [
        'compass'
        , 'autoprefixer:css'
        , 'concat:css'
        , 'cssmin:build'
    ])

}
