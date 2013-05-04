# encoding: iso-8859-1
# file TCPClient.rb
require 'socket'
 
port = 9090
hostname = 'lab2-rafaelc'
 
serverSocket = TCPSocket.open(hostname, port)
# declara e inicializa as vari�veis com o tipo String
numero_1 = ""
numero_2 = ""
# Declara as vari�veis com o tipo float por conta das divis�es
soma = 0.0
subtracao = 0.0
multiplicacao = 0.0
divisao = 0.0

# solicita o primeiro n�mero ao usu�rio
puts "Entre com o primeiro valor!. Em seguida tecle Enter"
numero_1 = gets.chomp

# solicita o segundo n�mero ao usu�rio
puts "Entre com o segundo valor! Em seguida tecle Enter"
numero_2 = gets.chomp

serverSocket.puts "#{numero_1}"
serverSocket.puts "#{numero_2}"

puts("Resultados:")
#Recebe mensagem do servidor
while message = serverSocket.gets
   puts message.chop
end
serverSocket.close