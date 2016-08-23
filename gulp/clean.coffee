gulp = require 'gulp'
del  = require 'del'

gulp.task 'clean', -> 
	# clean image output
	del 'dist/images/*.*'
	# clean css / stylus output
    del 'dist/css/*.css'
    # clean jade output
    del 'dist/*.html'
    # clean javascript output
    del 'dist/js/*.js'
    del 'dist/js/*.js.map'