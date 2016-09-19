config = require './config.coffee'

gulp   = require 'gulp'
gutil  = require 'gulp-util'
run    = require 'run-sequence'
jade   = require 'gulp-jade'
stylus = require "gulp-stylus"

webpack     = require "webpack"
browserSync = require("browser-sync").get( config.browserSync_identifier )

gulpwebpack = require 'gulp-webpack'

webpackConfig = require("./../webpack.config.coffee")

gulp.task 'webpack:build', (cb) ->

    gulp.src 'src/entry.js'
        .pipe gulpwebpack()
        .pipe gulp.dest 'dist/'



gulp.task 'webpack:build', (cb) ->

    # Transform config for Build task
    webpackConfig.plugins.push new webpack.optimize.UglifyJsPlugin sourceMap:false, compress: {warnings: false}

    # webpack
    webpack webpackConfig, (err, stats) ->
        if err then throw new gutil.PluginError "webpack:build" , err
        gutil.beep()
        gutil.log "[webpack:build]", stats.toString colors: true
        cb()

gulp.task 'webpack:watch', (cb) ->

    # Transform config for Watch task
    webpackConfig.debug = true
    webpackConfig.devtool = "source-map"
    webpackConfig.watch = true
    webpackConfig.devServer =
        aggregateTimeout : 300
        quiet            : false
        noInfo           : false
        lazy             : true
        port             : 3000

    # webpack
    webpack webpackConfig, (err, stats) ->
        if err then throw new gutil.PluginError "webpack:watch" , err
        gutil.log "[webpack:watch]", stats.toString colors: true
        browserSync.reload()