cryptocoinjs.com
================

http://cryptocoinjs.com

Documentation for CryptoCoinJS and its modules.


Building the Documentation
--------------------------

The documentation is built using [mkdocs](http://www.mkdocs.org/)

### Mac OS X 10.9 / Xcode 5.1 (needed for command line tools)

sudo into bash (so that we can set env variables to [prevent an error](http://stackoverflow.com/questions/22703393/clang-error-unknown-argument-mno-fused-madd-wunused-command-line-argumen))

    sudo bash

set env vars:

    export CFLAGS=-Qunused-arguments
    export CPPFLAGS=-Qunused-arguments

install mkdocs:

    pip install mkdocs

(if pip is not installed):

    easy_install pip