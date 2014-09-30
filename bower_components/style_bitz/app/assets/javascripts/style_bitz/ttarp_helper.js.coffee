$ = jQuery

class @StyleBitz.TtarpHelper

  @override   = undefined
  @cookieName = 'ttarp_override'
  @cookieDays = 30

  @setOverride: (value) ->
    @override = value
    $ => @setCookieOverride(value)

  @setCookieOverride: (value) ->
    $.cookie @cookieName, value, expires: @cookieDays, path: '/'

  @clear: ->
    $.removeCookie @cookieName, path: '/'

  constructor: ->
    @allOverrideable = $('[data-js="ttarp-overrideable"]')
    @updateUI()

  override: ->
    @constructor.override or @getCookieOverride()

  updateUI: ->
    value = @override()
    if value?
      @allOverrideable.text(value)

  # Private

  setCookieOverride: ->
    @constructor.setCookieOverride @override()

  getCookieOverride: ->
    $.cookie @constructor.cookieName


$ => new @StyleBitz.TtarpHelper
