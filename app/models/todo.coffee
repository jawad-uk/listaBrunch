# Model = require './model'

module.exports = class Todo extends Backbone.Model
	defaults: 
		content: 'blank'
		done: no
		list: 'inbox'

	# validate: (attrs) ->
	# 	if attrs.content = ""
	# 		"ما كتبت موضوع"
	
	toggle: -> 
		@save done: not @get 'done'

	clear: ->
		console.log("just cleared a todo model")
		@.model.destroy()
