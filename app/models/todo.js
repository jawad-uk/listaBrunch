// Generated by CoffeeScript 1.6.3
var Model, todo, _ref,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

Model = require('./model');

module.exports = todo = (function(_super) {
  __extends(todo, _super);

  function todo() {
    _ref = todo.__super__.constructor.apply(this, arguments);
    return _ref;
  }

  todo.prototype.defaults = {
    content: 'blank',
    done: false,
    list: 'inbox'
  };

  todo.prototype.urlRoot = "/todos";

  todo.prototype.toggle = function() {
    return this.save({
      done: !this.get('done')
    });
  };

  todo.prototype.clear = function() {
    this.destroy();
    return console.log(this);
  };

  return todo;

})(Model);
