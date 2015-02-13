EventListener = require('react/lib/EventListener')
React = require('react')

AppActions = require('../actions/AppActions')
AppConstants = require('../constants/AppConstants')
RouteUtils = require('../utils/RouteUtils')

{Pages} = AppConstants

getHref = (page, params) ->
  href = RouteUtils.makePath(page, params)
  {href: href}

Navigate = React.createClass({
  displayName: 'Navigate',

  propTypes: {
    page: React.PropTypes.oneOf(Object.keys(Pages)).isRequired,
    params: React.PropTypes.object
  },

  getInitialState: ->
    getHref(@props.page, @props.params)

  componentWillReceiveProps: (nextProps) ->
    @setState(getHref(nextProps.page, nextProps.params))

  onClick: (e) ->
    @props.onClick?(e)

    if (e.metaKey || e.shiftKey || e.altKey || e.ctrlKey) then return

    e.preventDefault()
    {href} = @state
    {page} = @props
    if (window.location.pathname != href)
      window.history.pushState({}, document.title, href)

    AppActions.navigateSwitchPage(href, page)

  render: ->
    React.createElement('a',
      React.__spread({}, @props, {onClick: @onClick, href: @state.href}),
      @props.children
    )

  statics: {
    PopStateMixin: {
      _popStateListener: null,

      _onPopState: (e) ->
        url = location.pathname
        AppActions.popStateSwitchPage(url)

      componentDidMount: ->
        listener = EventListener.listen(window, 'popstate', @_onPopState)
        @_popStateListener = listener

      componentWillUnmount: ->
        @_popStateListener.remove()
        @_popStateListener = null
    }
  }
})

module.exports = Navigate