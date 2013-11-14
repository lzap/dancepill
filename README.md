Dancepill
=========

Quick extract script for Bash.

The problem
-----------

You want to extract directory fast. Using midnight commander or other
extraction tools is very slow. Use dancepill:

    cd ~/bin
    git clone https://github.com/lzap/dancepill.git

And in your .bashrc do:

    source ~/bin/dancepill/dancepill

Logout or source it in your current terminal and start extracting:

    e tarball.tar.gz
    e tarball.tar.bzip2
    e tarball.xz
    e tarball.zip
    e whatever

There an function name called `dancepill` that does the extraction plus alias
`e` for it. Lot's of users already use `e` as an alias, so it can be
redefined.

Additional features
-------------------

 * If the archive does not contain only one file or directory, dancepill
   will create an extra directory for you. No more extracted junk in the
   current directory!

License
-------

This is PUBLIC DOMAIN, do what you need to do. Pull requests appreciated!
