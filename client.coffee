(($) ->

  editor = null
  input = null
  socket = null

  metaKeys =
    27: '<esc>'
    8: '<bs>'
    13: '<cr>'

  metaKeysList = (key for key, value of metaKeys)

  start = ->
    editor = $ '#editor'
    input = $ '#input'
    socket = io.connect 'http://localhost:8000'
    do bind

  bind = ->
    input.keypress handler
    input.keyup metaHandler
    socket.on 'update', (data) ->
      editor.html "<pre>#{data}</pre>"

  handler = (e) ->
    k = e.keyCode
    if k in metaKeysList
      return 
    letter = String.fromCharCode k
    socket.emit 'key', letter

  metaHandler = (e) ->
    for key, value of metaKeys
      key = parseInt key
      if e.keyCode is key
        socket.emit 'key', value
        return
  $ ->
    do start

)(jQuery)
