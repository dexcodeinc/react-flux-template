React = require('react')

AppConstants = require('../constants/AppConstants')
Navigate = require('./Navigate')

{Pages} = AppConstants

Home = React.createClass({
  propTypes: {
    appState: React.PropTypes.object.isRequired
  }

  render: ->
    (
      <div>
        <h1>Home</h1>
        <Navigate page={Pages.HELLO_WORLD}>Go to "hello world"</Navigate>
      </div>
    )
})

module.exports = Home