if process.env.NODE_ENV isnt 'production'
  require('source-map-support').install()

_ = require('underscore')
express = require('express')
fs = require('fs')
htmlescape = require('htmlescape')
morgan = require('morgan')

ServerConstants = require('./constants/ServerConstants')
{Config, LayoutConfig} = ServerConstants

server = express()
layout = _.template(fs.readFileSync(Config.LAYOUT_FILE, 'utf8'))

server.use(morgan('dev'))
server.use('/', express.static(Config.PUBLIC_DIR))

server.get '*', (req, res) ->
  bootstrap = { path: req.path }

  layoutData = _.defaults({
    applicationStart: "Application.start('#{htmlescape(bootstrap)}')"
  }, LayoutConfig)

  if (Config.SSR)
    Application = require(Config.APPLICATION_FILE)
    rootComponentHTML = Application.start(bootstrap)
    layoutData.rootComponentHTML = rootComponentHTML
    status = Application.RouteUtils.hasMatch(req.path) ? 200 : 404
  else
    status = 200

  markup = layout(layoutData)

  res.status(status).send(markup)

server.listen(Config.PORT)

console.log('Server started with NODE_ENV="%s" on PORT="%s"', Config.NODE_ENV, Config.PORT)