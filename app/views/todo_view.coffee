View = require './view'

module.exports = class TodoView extends View
  template: require './templates/todo'
  tagName: 'li'
  # logging: off
  events:
    'click .check': 'toggleDone'
    'dblclick .todo-content': 'edit'
    'focusout .todo-input': 'update'
    'keypress .todo-input': 'updateOnEnter'
    'click .todo-destroy': 'clear'


  # initialize: ->
  #   # @model.on 'change', @render 

  getRenderData: ->
    {
      todo: @model.toJSON()
    }

  render: ->
    generatedHTML = @template(@getRenderData()) 
    $log('rendering todo html', generatedHTML)
    @$el.html generatedHTML 
    @

  # afterRender: ->
  #   @$('#new-todo').bind 'blur', @update

  toggleDone: ->
    @model.toggle()

  edit: ->
    console.log('start edit')
    @$el.addClass 'editing'
    $('.todo-input').focus()

  update: =>
    console.log('called update method')
    @model.save content: @$('.todo-input').val()
    @$el.removeClass 'editing'

  updateOnEnter: (event) ->
    @update() if event.keyCode is 13


  clear: ->
    @model.clear()  

