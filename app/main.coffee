if (process.env.NODE_ENV != 'production' && require('react/lib/ExecutionEnvironment').canUseDOM)
  window.React = require('react')

#
# Application Entry
#
ExecutionEnvironment = require('react/lib/ExecutionEnvironment')
React = require('react')

App = React.createFactory(require('./components/App'))
AppActions = require('./actions/AppActions')
AppConstants = require('./constants/AppConstants')

{LayoutConfig} = AppConstants

Application = {
  start: (bootstrap) ->
    # Ready the stores
    AppActions.initialize(bootstrap)

    # Client-side: mount the app component
    if (ExecutionEnvironment.canUseDOM)
      rootElement = document.getElementById(LayoutConfig.ROOT_ELEMENT_ID)
      React.render(App(), rootElement)
    else
    # Server-side: return the app's html
      rootComponentHTML = React.renderToString(App())
      rootComponentHTML
}

if (!ExecutionEnvironment.canUseDOM)
  Application.RouteUtils = require('./utils/RouteUtils')

module.exports = Application