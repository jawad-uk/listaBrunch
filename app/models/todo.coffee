module.exports = class Todo extends Backbone.Model
	defaults: 
		content: 'empty'
		done: no
		tag: 'general'

	urlRoot: '/todos'	
	
	validate: (attrs) -> 
		if attrs.content == 'لا شيد!'
			console.log('the todo needs a title')
	
	toggle: -> 
		@save done: not @get 'done'

	clear: ->
	    @destroy()