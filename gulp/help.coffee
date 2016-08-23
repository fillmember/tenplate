config = require './config.coffee'

gulp  = require 'gulp'
gutil = require 'gulp-util'
yargs = require 'yargs'

gulp.task 'help' , (cb) ->
	header = gutil.colors.bold
	title = gutil.colors.bgBlack.white
	text = [
		title ' TENPLATE '
		header 'usage: '
		'gulp [watch|build|clean] [options]'
	].join '\n'
	console.log text
	return cb()