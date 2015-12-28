gulp = require "gulp"
browserSync = require "browser-sync"


gulp.task 'browserSync', (cb) ->
    browserSync = browserSync.init {
        server: "./dist",
        port: 3000
    }
    cb()