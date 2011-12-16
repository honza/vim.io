vim.io
======

**vim.io** is a proof-of-concept real vim editor in the browser. Instead of
trying to implement vimscript in Javascript, it sends your commands to a remote
server running a headless vim instance which processes it and spits out the
content.

Dependencies
------------

* node.js
* coffeescript
* npm
* socket.io
* MacVim (with `mvim` command on the `PATH`)

Installing
----------

    $ git clone git://github.com/honza/vim.io.git
    $ cd vim.io
    $ npm install socket.io

Running
-------

    $ coffee server.coffee
    $ open index.html

Todo
----

* Implement auto-save and bring fresh content back
* Syntax highlighting
* Visual mode
* `Ctrl`-based commands
* Load custom `vimrc`
