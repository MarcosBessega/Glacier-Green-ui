root = document.documentElement

module.exports =
  activate: (state) ->
    atom.config.observe 'glacier-dark-ui.fontSize', (value) ->
      setFontSize(value)

    atom.config.observe 'glacier-dark-ui.layoutMode', (value) ->
      setLayoutMode(value)

  deactivate: ->
    unsetFontSize()
    unsetLayoutMode()

# Font Size -----------------------
setFontSize = (currentFontSize) ->
  if Number.isInteger(currentFontSize)
    root.style.fontSize = "#{currentFontSize}px"
  else if currentFontSize is 'Auto'
    unsetFontSize()

unsetFontSize = ->
  root.style.fontSize = ''

# Layout Mode -----------------------
setLayoutMode = (layoutMode) ->
  root.setAttribute('theme-glacier-dark-ui-layoutmode', layoutMode.toLowerCase())

unsetLayoutMode = ->
  root.removeAttribute('theme-glacier-dark-ui-layoutmode')
