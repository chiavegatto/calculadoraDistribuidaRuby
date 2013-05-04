#encoding: iso-8859-1
require 'socket'

port = 9091
host_server='0.0.0.0'
server =  TCPServer.open(host_server,port)
puts("Servidor Soma Executando") 
divisao=0.0
loop{
  Thread.start(server.accept) do |client|
    valor1=client.gets.to_f
    valor2=client.gets.to_f
    soma=valor1*valor2
    client.puts "#{divisao}"
    client.close
  end
}