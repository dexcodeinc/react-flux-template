AppConstants = require('./AppConstants')

{Pages} = AppConstants

module.exports = {
  RouteConfig: {
    DEFAULT_PATH: '/'
  }

  ROUTES: [
    [Pages.HOME, '/'],
    [Pages.HELLO_WORLD, '/helloworld']
  ]
}