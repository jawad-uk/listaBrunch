View = require './view'
TodoView = require './todo_view'

module.exports = class TodosView extends View
  logging: on
  # template: template
  el: '#todos-view'

  render: ->
    console.log("test console log")
    console.log(@)
    @$el.html('')
    for todo in @collection.models 
      view = new TodoView model: todo
      @$el.append view.render().el

  initialize: ->
    # @collection.bind 'add', @addOne
    @listenTo @collection, 'sync', @render


