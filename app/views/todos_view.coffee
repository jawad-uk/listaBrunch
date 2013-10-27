View = require './view'
TodoView = require './todo_view'
template = require './templates/todos'

module.exports = class TodosView extends View
  logging: on
  template: template
  el: '#todos-view'


  addOne: (todo) =>
    view = new TodoView model: todo
    @$el.find('#todos').append view.render().el

  addAll: =>
    @collection.each @addOne

  initialize: ->
    @collection.bind 'add', @addOne
    @collection.bind 'reset', @addAll
