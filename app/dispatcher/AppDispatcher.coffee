AppConstants = require('../constants/AppConstants')
Dispatcher = require('./Dispatcher')
assign = require('react/lib/Object.assign')

PayloadSources = AppConstants.PayloadSources

AppDispatcher = assign(new Dispatcher(), {

  #
  # @param {object} action The details of the action, including the action's
  #   type and additional data coming from the server.
  #
  handleServerAction: (action) ->
    payload = {
      source: PayloadSources.SERVER_ACTION
      action: action
    }
    @dispatch(payload)

  #
  # @param {object} action The details of the action, including the action's
  #   type and additional data coming from the view.
  #
  handleViewAction: (action) ->
    payload = {
      source: PayloadSources.VIEW_ACTION
      action: action
    }
    @dispatch(payload)

})

module.exports = AppDispatcher