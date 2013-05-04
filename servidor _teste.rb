 #!/usr/bin/ruby
 require 'socket'

 puts "Server run..."
 server = TCPServer.new('0.0.0.0',5000)
 while (session = server.accept)
   Thread.start do
       session.puts "ok"
       session.close
   end  
 end 