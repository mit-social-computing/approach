'use strict';

module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({
    // Metadata.
    pkg: grunt.file.readJSON('package.json'),
    banner: '/*! <%= pkg.title || pkg.name %> - v<%= pkg.version %> - ' +
      '<%= grunt.template.today("yyyy-mm-dd") %>\n' +
      '<%= pkg.homepage ? "* " + pkg.homepage + "\\n" : "" %>' +
      '* Copyright (c) <%= grunt.template.today("yyyy") %> <%= pkg.author.dev %>;' +
      ' Licensed <%= _.pluck(pkg.licenses, "type").join(", ") %> */\n',
    // Task configuration.
    jsSrc : '<%= pkg.assetsPath %>js/src/*.js',
    jsBuild : '<%= pkg.assetsPath %>js/build/<%= pkg.name %>.js',
    jsMin : '<%= pkg.assetsPath %>js/build/<%= pkg.name %>.min.js',
    sass : '<%= pkg.assetsPath %>css/sass/**/*.scss',
    css : '<%= pkg.assetsPath %>css/app.css',
    templates : '<%= pkg.assetsPath %>templates/**/*',
    markup : '<%= pkg.assetsPath %>markup/**/*.html',

    shell : {
        nightwatch : {
            command : './nightwatch -e chrome,default'
        }
    },

    replace : {
      build_replace : {
        options : {
          variables : {
            'hash' : '<%= ( (new Date()).valueOf().toString() ) + ( Math.floor( (Math.random()*1000000)+1 ).toString() ) %>'
          }
        },
        files : [
          {
            flatten : true,
            expand : true,
            src: ['<%= pkg.assetsPath %>build/header.html', '<%= pkg.assetsPath %>build/footer.html'],
            dest: '<%= pkg.assetsPath %>templates/default_site/views/partials/'
          }
        ]
      }
    },

    concat: {
      options: {
        banner: '<%= banner %>',
        stripBanners: true
      },
      dist: {
        src: ['<%= jsSrc %>'],
        dest: '<%= jsBuild %>'
      },
    },

    uglify: {
      options: {
        banner: '<%= banner %>'
      },
      dist: {
        src: '<%= concat.dist.dest %>',
        dest: '<%= jsMin %>'
      },
    },

    qunit: {
        all : {
            options : {
                urls : ['']
            }
        }
    },

    compass : {
        create : {
            config: '/config.rb'
        }
    },

    watch: {
        sass : {
            files : ['<%= sass %>'],
            tasks : ['compass']
        },
        hashed : {
            files : [
                '<%= pkg.assetsPath %>build/header.html'
                , '<%= pkg.assetsPath %>build/footer.html'
            ],
            tasks : ['replace']
        },
        markup : {
            files : ['<%= markup %>'],
            options : { livereload : true }
        },
        // jsCopy : {
        //     files : ['<%= jsSrc %>/*'],
        //     tasks : ['copy:dev'],
        //     options : {
        //         spawn : false,
        //         interrupt : true
        //     }
        // },
        reload : {
            files : [
                '<%= templates %>'
                , '!<%= pkg.assetsPath %>templates/**/header.html'
                , '!<%= pkg.assetsPath %>templates/**/footer.html'
                , '<%= jsBuild %>'
                , '<%= jsSrc %>'
                , '<%= css %>'
            ],
            options : { livereload : true }
        },
    },

    clean: {
        build : "build"
    }

  });

  // These plugins provide necessary tasks.
  grunt.loadNpmTasks('grunt-contrib-qunit');
  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-compass');
  grunt.loadNpmTasks('grunt-contrib-copy');
  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-replace');
  grunt.loadNpmTasks('grunt-shell');

  // Default task.
  grunt.registerTask('nightwatch', ['shell:nightwatch']);

};
