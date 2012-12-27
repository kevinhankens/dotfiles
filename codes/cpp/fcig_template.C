#include <iostream>
#include <boost/date_time/posix_time/posix_time.hpp>
#include <boost/program_options/environment_iterator.hpp>
#include "boost/cgi/fcgi.hpp"

using std::cerr;
using std::endl;
namespace fcgi = boost::fcgi;

std::size_t process_id()
{
  return getpid();
}

template<typename OStream, typename Request, typename Map>
void format_map(OStream& os, Request& req, Map& m, const std::string& title);

int handle_request(fcgi::request& req);

int main() {
  try {
    fcgi::service s;
    fcgi::acceptor a(s);
  
    int status(0);
    do {
      status = a.accept(&handle_request);
    } while (!status);
    
    return status;
  
  }
  catch(boost::system::system_error const& se){
    // This is the type of exception thrown by the library.
    std::cerr<< "[fcgi] System error: " << se.what() << std::endl;
    return -1;
  }
  catch(std::exception const& e){
    // Catch any other exceptions
    std::cerr<< "[fcgi] Exception: " << e.what() << std::endl;
    return -2;
  }
  catch(...){
    std::cerr<< "[fcgi] Uncaught exception!" << std::endl;
    return -3;
  }
}

/// Handle one request.
int handle_request(fcgi::request& req)
{
  boost::system::error_code ec;
  
  //
  // Load in the request data so we can access it easily.
  //
  req.load(fcgi::parse_all);

  //
  // Construct a `response` object (makes writing/sending responses easier).
  //
  fcgi::response resp;

  //
  // Responses in CGI programs require at least a 'Content-type' header. The
  // library provides helpers for several common headers:
  //
  resp<< fcgi::content_type("text/html");

  resp<< "Hello W!"
      << req.get["kevin"];

  resp<< "Response content-length == "
      << resp.content_length(); // the content-length (returns std::size_t)

  return fcgi::commit(req, resp);
} 
