// Generated by CoffeeScript 1.6.3
var TodoView, TodosView, View, template, _ref,
  __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

View = require('./view');

TodoView = require('./todo_view');

template = require('./templates/todos');

module.exports = TodosView = (function(_super) {
  __extends(TodosView, _super);

  function TodosView() {
    this.addAll = __bind(this.addAll, this);
    this.addOne = __bind(this.addOne, this);
    _ref = TodosView.__super__.constructor.apply(this, arguments);
    return _ref;
  }

  TodosView.prototype.logging = true;

  TodosView.prototype.template = template;

  TodosView.prototype.el = '#todos-view';

  TodosView.prototype.addOne = function(todo) {
    var view;
    view = new TodoView({
      model: todo
    });
    return this.$el.find('#todos').append(view.render().el);
  };

  TodosView.prototype.addAll = function() {
    return this.collection.each(this.addOne);
  };

  TodosView.prototype.initialize = function() {
    this.collection.bind('add', this.addOne);
    return this.collection.bind('reset', this.addAll);
  };

  return TodosView;

})(View);
