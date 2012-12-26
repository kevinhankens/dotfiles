#C++ Notes

##boost
$ sudo apt-get install libboost-all-dev
$ wget # http://sourceforge.net/projects/cgi/files/latest/download?source=files
$ bunzip2 cgi...bz
$ sudo cp -r cgi/boost/* /usr/include/boost   #*

Add boost to your path in .bashrc
export PATH=$PATH:/usr/include/boost

Include in your cpp file:
#include <boost/cgi/fcgi.hpp>

##fcgi
Compiling the example file
$ g++ -o pong.w pong.C -lboost_system -lfcgi -lboost_filesystem

##ctemplate
http://code.google.com/p/ctemplate/
