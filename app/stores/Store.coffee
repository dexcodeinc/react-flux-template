{EventEmitter} = require('events')
assign = require('react/lib/Object.assign')

CHANGE_EVENT = 'change'

Store = ->

assign(Store.prototype, EventEmitter.prototype, {
  #
  # The token returned by `AppDispatcher.register(..)`
  # Can be used by `AppDispatcher.waitFor()`
  #
  dispatchToken: null

  emitChange: ->
    @emit(CHANGE_EVENT)

  addChangeListener: (callback) ->
    @on(CHANGE_EVENT, callback)

  removeChangeListener: (callback) ->
    @removeListener(CHANGE_EVENT, callback)
})

module.exports = Store