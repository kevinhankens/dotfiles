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
Download
http://code.google.com/p/ctemplate/
- Easiest to build from source to get latest version, just ./configure && make && sudo make install
Compiling
$ g++ -o example example.C -lctemplate_nothreads
Docs at http://ctemplate.googlecode.com/svn/trunk/doc/index.html

##mongoose
git://github.com/valenok/mongoose.git

##libmicrohttpd
http://www.gnu.org/software/libmicrohttpd/
$ sudo apt-get install texinfo
$ autoreconf -fi
$ ./configure
$ make
$ sudo make install

## Thrift
http://thrift.apache.org/
https://github.com/apache/thrift

## Scribe
https://github.com/facebook/scribe

