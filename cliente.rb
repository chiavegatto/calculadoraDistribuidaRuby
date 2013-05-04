# encoding: iso-8859-1
# file TCPClient.rb
require 'socket'
 
port = 9090
hostname = 'localhost'
 
server_socket = TCPSocket.open(hostname, port)
# declara e inicializa as vari�veis com o tipo String
numero_1 = ""
numero_2 = ""
operacao = ""

# solicita o primeiro n�mero ao usu�rio
puts "Entre com o primeiro valor!. Em seguida tecle Enter"
numero_1 = gets.chomp

# solicita a operacao matematica
puts "Informe a operacao matematica. Em seguida tecle Enter"
operacao = gets.chomp

# solicita o segundo n�mero ao usu�rio
puts "Entre com o segundo valor! Em seguida tecle Enter"
numero_2 = gets.chomp

server_socket.puts "#{numero_1}"
server_socket.puts "#{operacao}"
server_socket.puts "#{numero_2}"

puts("Resultados:")
#Recebe mensagem do servidor
while message = server_socket.gets
  puts message.chop
end
server_socket.close