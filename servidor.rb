#encoding: iso-8859-1
require 'socket'

port = 9090
port_soma=9091
host_soma = 'localhost'
host_server='0.0.0.0'
valor1=""
valor2=""
soma=0.0
server =  TCPServer.open(host_server,port)
puts("Servidor Proxy Executando") 
loop{
	Thread.start(server.accept) do |client|
		valor1=client.gets
		valor2=client.gets
		serverSocket = TCPSocket.open(host_soma, port_soma)
		serverSocket.puts("#{valor1}")
		serverSocket.puts("#{valor2}")
		soma=serverSocket.gets.chop
		client.puts("Soma: #{soma}")
		client.close
  end

}