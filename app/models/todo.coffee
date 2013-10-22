Model = require './model'

module.exports = class todo extends Model
	defaults: 
		content: 'ما فيه شيء'
		done: no
		list: 'inbox'

	toggle: -> 
		@save done: not @get 'done'

	clear: -> 
		@destroy()
		@view.remove()