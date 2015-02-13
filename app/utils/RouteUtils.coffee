ExecutionEnvironment = require('react/lib/ExecutionEnvironment')
RouteBuilder = require('route-builder')

AppConstants = require('../constants/AppConstants')
RouteConstants = require('../constants/RouteConstants')

{Pages} = AppConstants
{RouteConfig} = RouteConstants

router = RouteBuilder(RouteConstants.ROUTES)

RouteUtils = {
  getBestAvailablePath: (options) ->
    if options and options.path
      options.path
    else if ExecutionEnvironment.canUseDOM
      window.location.pathname
    else
      RouteConfig.DEFAULT_PATH

  getPage: (path) ->
    match = router.match(path)
    (match and match.name) or Pages.NOT_FOUND

  hasMatch: (path) ->
    RouteUtils.getPage(path) isnt Pages.NOT_FOUND

  makePath: (name, params) ->
    router.makePath(name, params)
}

module.exports = RouteUtils