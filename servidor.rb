#encoding: iso-8859-1
require 'socket'


port_soma=9091
host_soma = 'localhost'
port_subtracao=9092
host_subtracao = 'localhost'
port_multiplicacao = 9093
host_multiplicacao='localhost'
port_divisao = 9094
host_divisao = 'localhost'
host_server='0.0.0.0'
port = 9090
valor1=""
valor2=""
operacao=""
resultado=0.0
server =  TCPServer.open(host_server,port)
puts("Servidor Proxy Executando") 
loop{
	Thread.start(server.accept) do |client|
		valor1=client.gets
    operacao=client.gets
		valor2=client.gets
    if operacao == '+'
      puts "Enviando para o servidor Soma: "
      serverSocket = TCPSocket.open(host_soma, port_soma)
      serverSocket.puts("#{valor1}")
      serverSocket.puts("#{valor2}")
    elsif operacao == '-'
      puts "Enviando para o servidor Subtracao: "
      serverSocket = TCPSocket.open(host_subtracao, port_subtracao)
      serverSocket.puts("#{valor1}")
      serverSocket.puts("#{valor2}")
    elsif operacao == '*'
      puts "Enviando para o Servidor Multiplicacao: "
      serverSocket = TCPSocket.open(host_multiplicacao, port_multiplicacao)
      serverSocket.puts("#{valor1}")
      serverSocket.puts("#{valor2}")
    elsif operacao == '/'
      puts "Enviando para o servidor Divisao: "
      serverSocket = TCPSocket.open(host_divisao, port_divisao)
      serverSocket.puts("#{valor1}")
      serverSocket.puts("#{valor2}")
    end
		resultado=serverSocket.gets.chop
		client.puts("Resultado da operacao: #{resultado}")
		client.close
  end

}