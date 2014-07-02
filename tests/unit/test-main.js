'use strict';

var allTestFiles = [];
var TEST_REGEXP = /(spec|test)\.js$/i;

var pathToModule = function(path) {
  return path.replace(/^\/base\//, '').replace(/\.js$/, '');
};

Object.keys(window.__karma__.files).forEach(function(file) {
  if (TEST_REGEXP.test(file)) {
    // Normalize paths to RequireJS module names.
    allTestFiles.push(pathToModule(file));
  }
});

require.config({
  // Karma serves files under /base, which is the basePath from your config file
  baseUrl: '/base',

  // dynamically load all test files
  deps: allTestFiles,

  // we have to kickoff jasmine, as it is asynchronous
  callback: window.__karma__.start,
    shim: {
        "libgif" : {
             exports : "SuperGif"
        },
        "modernizr" : {
            exports : "Modernizr"
        }
    },
    paths: {
        app             : "webroot/assets/js/build",
        fastclick       : "webroot/assets/bower_components/fastclick/lib/fastclick",
        foundation      : "webroot/assets/bower_components/foundation/js/foundation",
        imagesloaded    : "webroot/assets/bower_components/imagesloaded/imagesloaded.pkgd.min",
        item            : "webroot/assets/bower_components/isotope/js/item",
        "layout-mode"   : "webroot/assets/bower_components/isotope/js/layout-mode",
        isotope         : "webroot/assets/bower_components/isotope/dist/isotope.pkgd.min",
        "fit-rows"      : "webroot/assets/bower_components/isotope/js/layout-modes/fit-rows",
        skrollr         : "webroot/assets/bower_components/skrollr/src/skrollr",
        modernizr       : "webroot/assets/js/lib/modernizr/custom.modernizr",
        lodash          : "webroot/assets/js/lib/lodash/lodash.min",
        jquery          : "webroot/assets/js/lib/jquery/animate-jquery",
        libgif          : "webroot/assets/js/lib/libgif/libgif",
    },
});
