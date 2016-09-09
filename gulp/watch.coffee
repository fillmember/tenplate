config = require './config.coffee'

gulp   = require 'gulp'
gutil  = require 'gulp-util'
run    = require 'run-sequence'
jade   = require 'gulp-jade'
stylus = require "gulp-stylus"

webpack     = require "webpack"
browserSync = require("browser-sync").get( config.browserSync_identifier )


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

gulp.task 'webpack:watch', (cb) ->

    webpackConfig = require("./../webpack.config.coffee")

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