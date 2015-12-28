gulp = require 'gulp'
del  = require 'del'

gulp.task 'clean', -> 
    del 'dist/js/*.js'
    del 'dist/css/*.css'
    del 'dist/*.html'