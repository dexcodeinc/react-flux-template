React = require('react')

AppConstants = require('../constants/AppConstants')
Navigate = require('./Navigate')

{Pages} = AppConstants

HelloWorld = React.createClass({
  propTypes: {
    appState: React.PropTypes.object.isRequired
  }

  render: ->
    (
      <div>
        <h1>Hello World!</h1>
        <Navigate page={Pages.HOME}>Go to "home"</Navigate>
      </div>
    )
})

module.exports = HelloWorld