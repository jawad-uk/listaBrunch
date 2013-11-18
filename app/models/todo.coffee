# Model = require './model'

module.exports = class Todo extends Backbone.Model
	defaults: 
		content: ''
		done: no
		tag: 'general'

	urlRoot: '/todos'	
	
	# validate: (attrs) -> 
	# 	if attrs.content = ''
	# 		return 'the todo needs a title'

	toggle: -> 
		@save done: not @get 'done'

	clear: ->
	    @destroy()