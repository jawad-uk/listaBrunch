View = require './view'

module.exports = class TodoView extends View
  template: require './templates/todo'
  tagName: 'li'
  events:
    # 'dblclick .todo-content': 'edit
    'focusout .todo-input': 'update'
    'keypress .todo-input': 'updateOnEnter'
    # 'click .todo-destroy': 'clear'

  hammerEvents:
    'swipeleft .todo': 'toggleDone'
    'swiperight .todo': 'toggleDone'

    'doubletap .todo-content': 'edit'
    'tap .todo-destroy': 'clear'


  getRenderData: ->
    {
      todo: @model.toJSON()
    }

  render: ->
    generatedHTML = @template(@getRenderData()) 
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

