config = require './config.coffee'

gulp = require "gulp"
browserSync = require("browser-sync").create( config.browserSync_identifier )

gulp.task 'browserSync', (cb) ->
    browserSync.init {
        server: config.destination_path,
        port: 3000
    }
    cb()