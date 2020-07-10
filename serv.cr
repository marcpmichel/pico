require "http/server"
require "file"

# server = HTTP::Server.new(8080) do |context|
  # context.response.content_type = "text/plain"
  # context.response.print "Hello world!"
# end

server = HTTP::Server.new( [ HTTP::ErrorHandler.new, HTTP::LogHandler.new, ]) do |context|
  # puts context.inspect
  puts context.request.resource.inspect
  case context.request.resource
    when "/dist/fonts/Roboto-Regular-webfont.woff2"
      context.response.content_type = "font/woff2"
      context.response.print File.read("dist/fonts/Roboto-Regular-webfont.woff2");
    when "/dist/fonts/Roboto-Medium-webfont.woff2"
      context.response.content_type = "font/woff2"
      context.response.print File.read("dist/fonts/Roboto-Medium-webfont.woff2");
    when "/dist/fonts/webixfa-webfont.woff2"
      context.response.content_type = "font/woff2"
      context.response.print File.read("dist/fonts/webixfa-webfont.woff2");
    when "/dist/fonts/webixmdi-webfont.woff2"
      context.response.content_type = "font/woff2"
      context.response.print File.read("dist/fonts/webixmdi-webfont.woff2");
    when "/dist/style.css"
      context.response.content_type = "text/css"
      context.response.print File.read("dist/webix.css");
    when "/dist/main.js"
      context.response.content_type = "application/javascript"
      context.response.print File.read("dist/main.js");
    when "/"
      context.response.content_type = "text/html"
      context.response.print File.read("dist/index.html");
      # context.response.print "<!DOCTYPE html><html><head><script src=\"dist/main.js\"></script></head><body></body></html>";
    else
      context.response.status = HTTP::Status::NOT_FOUND
      context.response.print ":("
  end
end

address = server.bind_tcp(8123)
puts "Listening on http://#{address}"
server.listen

