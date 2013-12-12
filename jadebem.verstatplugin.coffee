fs = require 'fs'
path = require 'path'
BEM_FILE_CONTENT = fs.readFileSync path.dirname(__filename) + '/BEM.jade', encoding: 'utf8'

module.exports = (next) ->
	@preprocessor 'jadebem',
		srcExtname: '.jade'
		priority: 99
		preprocess: (file, donePreprocessor) =>
			file.source = BEM_FILE_CONTENT + "\n" + file.source
			@modified file
			donePreprocessor()
	next()