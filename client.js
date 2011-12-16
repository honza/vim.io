(function() {
  var __indexOf = Array.prototype.indexOf || function(item) {
    for (var i = 0, l = this.length; i < l; i++) {
      if (this[i] === item) return i;
    }
    return -1;
  };
  (function($) {
    var bind, editor, handler, input, key, metaHandler, metaKeys, metaKeysList, socket, start, value;
    editor = null;
    input = null;
    socket = null;
    metaKeys = {
      27: '<esc>',
      8: '<bs>',
      13: '<cr>'
    };
    metaKeysList = (function() {
      var _results;
      _results = [];
      for (key in metaKeys) {
        value = metaKeys[key];
        _results.push(key);
      }
      return _results;
    })();
    start = function() {
      editor = $('#editor');
      input = $('#input');
      socket = io.connect('http://localhost:8000');
      return bind();
    };
    bind = function() {
      input.keypress(handler);
      input.keyup(metaHandler);
      return socket.on('update', function(data) {
        return editor.html("<pre>" + data + "</pre>");
      });
    };
    handler = function(e) {
      var k, letter;
      k = e.keyCode;
      if (__indexOf.call(metaKeysList, k) >= 0) {
        return;
      }
      letter = String.fromCharCode(k);
      return socket.emit('key', letter);
    };
    metaHandler = function(e) {
      var key, value;
      for (key in metaKeys) {
        value = metaKeys[key];
        key = parseInt(key);
        if (e.keyCode === key) {
          socket.emit('key', value);
          return;
        }
      }
    };
    return $(function() {
      return start();
    });
  })(jQuery);
}).call(this);
