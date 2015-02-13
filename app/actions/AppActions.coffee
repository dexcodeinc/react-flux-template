AppConstants = require('../constants/AppConstants')
AppDispatcher = require('../dispatcher/AppDispatcher')
RouteUtils = require('../utils/RouteUtils')

{ActionTypes} = AppConstants

AppActions = {
  initialize: (bootstrap) ->
    if (!bootstrap) then bootstrap = {}
    path = RouteUtils.getBestAvailablePath(bootstrap)
    page = RouteUtils.getPage(path)
    action = {
      type: ActionTypes.APP_INITIALIZE
      path: path
      page: page
    }
    AppDispatcher.handleServerAction(action)

  reset: ->
    AppDispatcher.handleServerAction({
      type: ActionTypes.APP_RESET
    })

  navigateSwitchPage: (path, page) ->
    action = {
      type: ActionTypes.SWITCH_PAGE
      page: page
      path: path
    }
    AppDispatcher.handleViewAction(action)

  popStateSwitchPage: (path) ->
    page = RouteUtils.getPage(path)
    action = {
      type: ActionTypes.SWITCH_PAGE
      page: page
      path: path
    }
    AppDispatcher.handleViewAction(action)
}

module.exports = AppActions