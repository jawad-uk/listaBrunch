Todos = require 'models/todos'
HomeView = require 'views/home_view'
NewTodoView = require 'views/new_todo_view'
StatsView = require 'views/stats_view'
TodoView = require 'views/todo_view'
TodosView = require 'views/todos_view'

module.exports = class Router extends Backbone.Router
  routes:
    '': 'home'

  initialize: ->
    @todos = new Todos 
    @homeView = new HomeView()
    @statsView = new StatsView collection: @todos
    @newTodoView = new NewTodoView collection: @todos
    @todosView = new TodosView collection: @todos

  home: ->
    @todos.fetch()
