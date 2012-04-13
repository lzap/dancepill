Dancepill
=========

Quick extract script for Bash.

The problem
-----------

You want to extract directory fast. Using midnight commander or other 
extraction tools is very slow. Use dancepill, in your .bashrc do:

    source path/to/your/git/clone/e

Logout or source it in your current terminal and start extracting:

    e tarball.tar.gz
    e tarball.tar.bzip2
    e tarball.xz
    e tarball.zip
    e whatever

Additional features
-------------------

 * If the archive does not contain only one file or directory, dancepill
   will create an extra directory for you. No more extracted junk in the
   current directory!

License
-------

This is PUBLIC DOMAIN, do what you need to do. Pull requests appreciated!
