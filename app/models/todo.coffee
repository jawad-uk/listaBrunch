Model = require './model'

module.exports = class Todo extends Model
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
		@.model.destroy()
