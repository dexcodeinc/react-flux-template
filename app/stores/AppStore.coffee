AppConstants = require('../constants/AppConstants')
AppDispatcher = require('../dispatcher/AppDispatcher')
Store = require('./Store')
assign = require('react/lib/Object.assign')

{ActionTypes} = AppConstants

appState = null

reset = ->
  appState = {}

AppStore = assign(new Store(), {
  getState: ->
    appState
})

AppStore.dispatchToken = AppDispatcher.register (payload) ->
  {action} = payload

  switch action.type
    when ActionTypes.APP_INITIALIZE
      reset()
      appState.page = action.page
      appState.path = action.path
    when ActionTypes.SWITCH_PAGE
      appState.page = action.page
      appState.path = action.path
    when ActionTypes.APP_RESET
      reset()
    else
      return

  AppStore.emitChange()

module.exports = AppStore