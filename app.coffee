express = require('express')
routes = require('./routes')
fs = require 'fs'
sys = require('sys')
exec = require('child_process').exec

app = module.exports = express.createServer()

app.configure ->
  app.set('views', __dirname + '/views')
  app.set('view engine', 'jade')
  app.use(express.bodyParser())
  app.use(express.methodOverride())
  app.use(app.router)
  app.use(express.static(__dirname + '/public'))

app.configure 'development', ->
  app.use(express.errorHandler({ dumpExceptions: true, showStack: true }))

app.configure 'production', ->
  app.use(express.errorHandler()); 

# Routes
app.get('/', routes.index);

app.listen(80);
console.log("Express server listening on port %d in %s mode", app.address().port, app.settings.env);

io = require('socket.io').listen(app)

io.sockets.on 'connection', (socket) ->
  console.log 'connected'
  return
  exec "mvim --servername vimserver #{__dirname}/file"
  socket.on 'key', (key) ->
    exec "mvim --servername vimserver --remote-send '#{key}'", (er, stdout, stderr) ->
      fs.readFile __dirname + '/mle', 'utf-8', (err, data) ->
        socket.emit 'update', data
