config = require './config.coffee'

gulp   = require 'gulp'
gutil  = require 'gulp-util'
run    = require 'run-sequence'
jade   = require 'gulp-jade'
stylus = require "gulp-stylus"

gulp.task 'watch', ->
    run(
        'clean'
        'build-files'
        'browserSync'
        'webpack:watch'
    )

    gulp.watch config.stylus_selector , [ 'build-stylus' ]
    gulp.watch config.css_selector    , [ 'build-css'    ]
    gulp.watch config.jade_selector   , [ 'build-jade'   ]
    gulp.watch config.image_selector  , [ 'build-image'  ]