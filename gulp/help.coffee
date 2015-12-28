gulp  = require 'gulp'
yargs = require 'yargs'

gulp.task 'help' , (cb) ->
	helpText = [
		''
		'gulp [watch|build|clean] [options]'
	].join('\n')
	yargs
		.usage(helpText)
		.describe('dev'  ,'set __DEV__ to true')
		.describe('nodev','set __DEV__ to false')
	yargs.showHelp()
	return cb()