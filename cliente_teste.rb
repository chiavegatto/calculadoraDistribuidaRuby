#!/usr/bin/env ruby
require 'socket'

clientSession = TCPSocket.new( "localhost", 5000)
while !(clientSession.closed?) && (serverMessage = clientSession.gets)
  if serverMessage =~/ok/
    puts "connect"
  end
end 