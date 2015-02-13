React = require('react')

AppConstants = require('../constants/AppConstants')
AppStore = require('../stores/AppStore')
PopStateMixin = require('./Navigate').PopStateMixin

{Pages} = AppConstants

getPageComponent = (page) ->
  switch page
    when Pages.HOME
      return require('./Home.cjsx')
    when Pages.HELLO_WORLD
      return require('./HelloWorld.cjsx')
    when Pages.NOT_FOUND
      return require('./NotFound')
    else
      throw new Error('Missing "Pages.' + page + '"')

getStateFromStores = ->
  {
    appState: AppStore.getState()
  }

App = React.createClass({
  displayName: 'App'

  mixins: [PopStateMixin]

  _onChange: ->
    @setState(getStateFromStores())

  getInitialState: ->
    getStateFromStores()

  componentDidMount: ->
    AppStore.addChangeListener(@_onChange)

  componentWillUnmount: ->
    AppStore.removeChangeListener(@_onChange)

  render: ->
    appState = @state.appState
    PageComponent = getPageComponent(appState.page)
    React.createElement(PageComponent, {appState: appState})
})

module.exports = App