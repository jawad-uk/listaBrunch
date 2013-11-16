View = require './view'

module.exports = class TodoView extends View
  template: require './templates/todo'
  tagName: 'li'
  # logging: off
  events:
    'click .check': 'toggleDone'
    'dblclick .todo-content': 'edit'
    'focusOut .editing': 'update'
    'click .todo-destroy': 'clear'
    'keypress .todo-input': 'updateOnEnter'

  initialize: ->
    @model.on 'change', @render 

  render: ->
    generatedHTML = @template(@getRenderData()) 
    $log('rendering todo html', generatedHTML)
    @$el.html generatedHTML 
    @

  getRenderData: ->
    {
      todo: @model.toJSON()
    }

  afterRender: ->
    @$('#new-todo').bind 'blur', @update

  toggleDone: ->
    @model.toggle()

  edit: ->
    @$el.addClass 'editing'
    $('.todo-input').focus()

  update: =>
    @model.save content: @$('.todo-input').val()
    @$el.removeClass 'editing'

  updateOnEnter: (event) ->
    @update() if event.keyCode is 13

  clear: ->
    @model.clear()  

