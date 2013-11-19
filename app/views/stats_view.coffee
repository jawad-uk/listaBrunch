View = require './view'
  
module.exports = class StatsView extends View
  template: require './templates/stats'
  el: '.stats-view'
  
  hammerEvents:
    'tap .todo-clear' : 'clearCompleted'

  initialize: ->
    @collection.on 'all', @render, @

  render: =>
    generatedHTML = @template(@getRenderData())
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

