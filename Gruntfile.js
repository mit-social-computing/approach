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
    jsSrc : 'source/js/*.js',
    jsDev : '<%= pkg.assetsPath %>js/build',
    jsBuild : '<%= pkg.assetsPath %>js/build/<%= pkg.name %>.js',
    jsMin : '<%= pkg.assetsPath %>js/build/<%= pkg.name %>.min.js',
    sass : 'source/sass/**/*.scss',
    templates : 'source/ee_templates/**/*.html',

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
            src: ['source/hashed/header.html'],
            dest: 'source/ee_templates/default_site/views/partials/'
          }
        ]
      }
    },

    copy : {
        dev : {
            src : [ '<%= jsSrc %>' ],
            dest : '<%= jsDev %>/',
            expand : true,
            flatten : true
        }
    },

    compass : {
        dev : {
            config: '/config.rb',
            environment : 'development'
        }
    },

    watch: {
        options : {
            livereload : true
        },
        files : [
            '<%= templates %>'
            , '<%= jsDev %>/*.js'
            , '<%= pkg.assetsPath %>css/*.css'
        ],
        sass : {
            files : ['<%= sass %>'],
            tasks : ['compass:dev']
        },
        hashed : {
            files : [
                'source/hashed/header.html'
            ],
            tasks : ['replace']
        },
        js : {
            files : ['<%= jsSrc %>'],
            tasks : ['copy:dev']
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
  grunt.registerTask('default', ['watch']);

};
