# Model = require './model'

module.exports = class Todo extends Backbone.Model
	defaults: 
		content: 'blank'
		done: no
		list: 'inbox'

	urlRoot: '/todos'	
	
	toggle: -> 
		@save done: not @get 'done'

	clear: ->
	    @destroy()