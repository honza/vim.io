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

License
-------

If anything comes of this, I'd like it to be free. As such, the use of the
source code is available under the terms of the General Public License v3.
Please no hatin' because of my choice of open source license. If you don't
like it, go elsewhere. Thanks.
