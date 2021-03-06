config = require './config.coffee'

gulp   = require 'gulp'
plumber = require 'gulp-plumber'
run    = require 'run-sequence'
jade   = require 'gulp-jade'
stylus = require 'gulp-stylus'
nib = require 'nib'

browserSync = require("browser-sync").get( config.browserSync_identifier )


gulp.task 'build', (cb) ->

    run(
        'clean'
        'build-files'
        'webpack:build'
        cb
    )

gulp.task 'build-files', (cb) ->
    run(
        [
            'build-css'
            'build-stylus'
            'build-jade'
            'build-image'
        ],
        cb
    )

gulp.task 'build-stylus', ->
    gulp.src config.stylus_selector
        .pipe plumber()
        .pipe stylus
            use: nib()
        .pipe gulp.dest( config.stylus_destination_path )
        .pipe browserSync.stream()

gulp.task 'build-css', ->
    gulp.src config.css_selector
        .pipe plumber()
        .pipe gulp.dest( config.css_destination_path )
        .pipe browserSync.stream()

gulp.task 'build-image', (cb) ->
    gulp
        .src config.image_selector
        .pipe plumber()
        .pipe gulp.dest( config.image_destination_path )
        .pipe browserSync.stream()

gulp.task 'build-jade', ->
    gulp.src config.jade_selector
        .pipe plumber()
        .pipe jade pretty: true
        .pipe gulp.dest( config.jade_destination_path )
        .pipe browserSync.stream()