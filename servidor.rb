#encoding: iso-8859-1
require 'socket'

port = 9090
portSoma=9091
hostSoma = 'lab2-rafaelc'
hostServer='0.0.0.0'
valor1=""
valor2=""
soma=0.0
server =  TCPServer.open(hostServer,port)
puts("Servidor Proxy Executando") 
loop{
	Thread.start(server.accept) do |client|
		valor1=client.gets
		valor2=client.gets
		serverSocket = TCPSocket.open(hostSoma, portSoma)
		serverSocket.puts("#{valor1}")
		serverSocket.puts("#{valor2}")
		soma=serverSocket.gets.chop
		client.puts("Soma: #{soma}")
		client.close
end

}