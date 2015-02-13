React = require('react')

AppConstants = require('../constants/AppConstants')
Navigate = require('./Navigate')

{Pages} = AppConstants

NotFound = React.createClass({
  displayName: 'NotFound'

  propTypes: {
    appState: React.PropTypes.object.isRequired
  }

  render: ->
    React.createElement('div', null,
      React.createElement('h1', null, 'Page not found'),
      React.createElement('h2', null, '404'),
      React.createElement('ul', null,
        React.createElement('li', null,
          React.createElement(Navigate, {page: Pages.HOME}, 'Go to "home"')
        ),
        React.createElement('li', null,
          React.createElement(Navigate, {page: Pages.HELLO_WORLD}, 'Go to "hello world"')
        )
      )
    )
})

module.exports = NotFound