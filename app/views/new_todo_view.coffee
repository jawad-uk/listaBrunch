BaseView = require './view'

module.exports = class NewTodoView extends BaseView
  # logging: on
  el: '#new-todo-view'
  events:
    'keypress #new-todo': (e) -> 
      # console.log(e.keyCode)
      @createTodo() if e.keyCode is 13
    'click #new-todo-submit': 'createTodo'
    'focus #new-todo': 'showButton'
    'focusout #new-todo': 'hideButton'

  newAttributes: ->
    attributes =
      order: @collection.nextOrder()
    attributes.content = @$('#new-todo').val() if @$('#new-todo').val()
    attributes

  createTodo: () ->
    # return unless keyCode is 13
    @collection.create @newAttributes()
    @$('#new-todo').val ''

  showButton: ->
    button = @$('#new-todo-submit')
    button.addClass 'display'

  hideButton: ->
    button = @$('#new-todo-submit')
    button.removeClass 'display'



