# Model = require './model'

module.exports = class Todo extends Backbone.Model
	defaults: 
		content: 'empty task... too much time on your hands?'
		done: no
		tag: 'general'

	urlRoot: '/todos'	
	
	toggle: -> 
		@save done: not @get 'done'

	clear: ->
	    @destroy()