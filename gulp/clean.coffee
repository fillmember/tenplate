config = require './config.coffee'

gulp = require 'gulp'
del  = require 'del'

gulp.task 'clean', -> 
	del config.all_destination_files