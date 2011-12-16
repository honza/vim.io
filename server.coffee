fs = require 'fs'
sys = require('sys')
exec = require('child_process').exec

handler = (req, res) ->
  console.log 'hit'
  fs.readFile(__dirname + '/index.html', (err, data) ->
    if err
      res.writeHead(500)
      return res.end('Error loading index.html')

    res.writeHead(200)
    res.end(data)
  )

app = require('http').createServer(handler)
io = require('socket.io').listen(app)
app.listen(8000)

io.sockets.on 'connection',  (socket) ->
  console.log 'connected'
  exec "mvim --servername vimserver #{__dirname}/file"
  socket.on 'key', (key) ->
    exec "mvim --servername vimserver --remote-send '#{key}'", (er, stdout, stderr) ->
      fs.readFile __dirname + '/mle', 'utf-8', (err, data) ->
        socket.emit 'update', data
