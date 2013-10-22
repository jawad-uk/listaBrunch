Application =
  initialize: ->
    Todos = require 'models/todos'
    Router = require 'routers/router'
    HomeView = require 'views/home_view'
    NewTodoView = require 'views/new_todo_view'
    StatsView = require 'views/stats_view'
    TodoView = require 'views/todo_view'
    TodosView = require 'views/todos_view'


    @todos = new Todos()

    @homeView = new HomeView()
    @statsView = new StatsView()
    @newTodoView = new NewTodoView()
    @todosView = new TodosView()

    # Instantiate the router
    @router = new Router()
    # Freeze the object
    Object.freeze? Application

module.exports = Application


