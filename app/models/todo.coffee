Model = require './model'

module.exports = class todo extends Model
	defaults: 
		content: 'blank'
		done: no
		list: 'inbox'

	# validate: (attrs) ->
	# 	if attrs.content = ""
	# 		"ما كتبت موضوع"
	
	urlRoot: "/todos"

	toggle: -> 
		@save done: not @get 'done'

	clear: ->
		@destroy()
		console.log(@)