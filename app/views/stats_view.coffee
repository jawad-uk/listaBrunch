View = require './view'
  
module.exports = class StatsView extends View
  logging: on
  template: require './templates/stats'
  el: '.stats-view'
  events:
    'click .todo-clear' : 'clearCompleted'

  initialize: ->
    @collection.on 'all', @render, @

  render: =>
    generatedHTML = @template(@getRenderData())
    $log('rendering stats', generatedHTML)
    @$el.html generatedHTML
    @

  getRenderData: ->
    {
      stats:
        total: @collection.length
        done: @collection.done().length
        remaining: @collection.remaining().length
    }

  clearCompleted: ->
    @collection.clearCompleted()

