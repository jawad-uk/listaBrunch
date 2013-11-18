View = require './view'
TodoView = require './todo_view'

module.exports = class TodosView extends View
  el: '#todos-view'

  render: ->
    @$el.html('')
    for todo in @collection.models 
      view = new TodoView model: todo
      @$el.append view.render().el

  initialize: ->
    @listenTo @collection, 'sync', @render
    @listenTo @collection, 'destroy', @render

