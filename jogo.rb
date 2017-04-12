class Trunfo
	attr_accessor :atributos, :nome, :venceu

	def initialize(nome)
		self.venceu = 0  
	    self.nome = nome
	end

	def Cartas
		self.atributos = {
			altura: Random.rand(61) + 150,
		  	peso: Random.rand(81) + 40,
		  	velocidade: Random.rand(18) + 1,
		  	força:  Random.rand(61) + 40
	    }
	end

	def duelar(adversario, campo)
		puts "O atributo a ser duelado é #{campo}"
    	if self.atributos[campo].to_i > adversario.atributos[campo].to_i
			self.venceu += 1
			puts "O competidor #{self.nome} venceu a rodada com #{atributos[campo]} contra #{adversario.atributos[campo]} do #{adversario.nome}"
			puts ' '
			return self.nome
		elsif atributos[campo].to_i <  adversario.atributos[campo].to_i
			adversario.venceu += 1
			puts "O competidor #{adversario.nome} venceu a rodada com #{adversario.atributos[campo]} contra #{atributos[campo]} do #{nome}"
			puts ' '
			return adversario.nome
		else
			puts 'Os competidores empataram'
			puts ' '
			return self.nome
		end
	end
end


class Computador
	attr_accessor :atributos, :nome, :venceu

	def initialize(nome)
		self.venceu = 0  
	    self.nome = nome
	end

	def Cartas
		self.atributos = {
			altura: Random.rand(61) + 150,
		  	peso: Random.rand(81) + 40,
		  	velocidade: Random.rand(18) + 1,
		  	força:  Random.rand(61) + 40
	    }
	end

	def FrasesD
		frase = [
		'Você me venceu desta vez, mas não se acostume com isso !!',
		'Perdi essa, mas um raio não cai duas vezes no mesmo lugar !!',
		'Parece que hoje é seu dia de sorte, você venceu',
		'VOCÊ SÓ PODE ESTAR USANDO HACK!!!',
		'Você venceu, parabéns..',
		'Eu deixei você ganhar, só pro jogo ter graça',
		'Sorte de principiante ..'
		]
		puts "#{frase[Random.rand(7)]}"
	end

	def FrasesV
		frase = [
		'PATO, MARRECO !!!',
		'Como faz para aumentar o nível aqui?',
		'O jogo já começou, pode começar a dificultar',
		'Desculpa, não sabia que você é café com leite',
		'Esqueci que estava jogando com iniciante, perdão, vou pegar leve agora',
		'Não é novidade, já sabia que ia ganhar',
		'Já acabou o aquecimento ?',
		'Quando o jogo vai começar?'
		]
		puts "#{frase[Random.rand(8)]}"
	end

	def EscolhaPC
		menor = 210
		escolha = :altura
		self.atributos.keys.each do |atributo| 
			if atributo == :altura
				if menor > 210 - self.atributos[:altura].to_i
					menor = 210 - self.atributos[:altura].to_i
					escolha = :altura
				end
			elsif atributo == :peso
				if menor > 120 - self.atributos[:peso].to_i
					menor = 120 - self.atributos[:peso].to_i
					escolha = :peso
				end
			elsif atributo == :velocidade
				if menor > 60 - (60 * self.atributos[:velocidade].to_i / 18)
					menor = 60 - (60 * self.atributos[:velocidade].to_i / 18)
					escolha = :velocidade
				end
			else
				if menor > 100 - self.atributos[:força].to_i
					menor = 100 - self.atributos[:força].to_i
					escolha = :força
				end
			end
		end
		return escolha
	end

	def duelar(adversario, campo)
		puts "O atributo a ser duelado é #{campo}"   
    	if self.atributos[campo].to_i > adversario.atributos[campo].to_i
			self.venceu += 1
			self.FrasesD
			puts "#{self.nome} : #{self.atributos[campo]}  x  #{adversario.atributos[campo]} : #{adversario.nome}"
			puts ' '
			return self.nome
		elsif atributos[campo].to_i <  adversario.atributos[campo].to_i
			adversario.venceu += 1
			self.FrasesV
			puts "#{adversario.nome} : #{adversario.atributos[campo]}  x  #{self.atributos[campo]}  : #{self.nome}"
			puts ' '
			return adversario.nome
		else
			puts 'Os competidores empataram'
			puts ' '
			return self.nome
		end
	end

	def duelarPC(adversario, campo)
		puts "O atributo a ser duelado é #{campo}"   
    	if self.atributos[campo].to_i > adversario.atributos[campo].to_i
			self.venceu += 1
			self.FrasesV
			puts "#{self.nome} : #{self.atributos[campo]}  x  #{adversario.atributos[campo]} : #{adversario.nome}"
			puts ' '
			return self.nome
		elsif atributos[campo].to_i <  adversario.atributos[campo].to_i
			adversario.venceu += 1
			self.FrasesD
			puts "#{adversario.nome} : #{adversario.atributos[campo]}  x  #{self.atributos[campo]}  : #{self.nome}"
			puts ' '
			return adversario.nome
		else
			puts 'Os competidores empataram'
			puts ' '
			return self.nome
		end
	end
end

c = '1'
while c == '1'
	puts 'Escolha uma opção'
	puts '1 : Para jogar com alguém '
	puts '2 : Para jogar com o Computador '
	puts '3 : Como jogar '
	m  = gets.chomp
	if m == '1'
		print 'Digite seu nome competidor 1: '
		name1 = gets.chomp.capitalize
		print 'Digite seu nome competidor 2: '
		name2 = gets.chomp.capitalize
		puts 'Tabela com os valores máximos :'
		puts 'altura = 210     peso = 120     velocidade = 18     força = 100'
		competidor1 = Trunfo.new(name1)
		competidor2 = Trunfo.new(name2)
		i = 0
		a = "#{name1}"
		while(i < 31 && competidor1.venceu < 16 && competidor2.venceu < 16)
		  if a == "#{name1}"
			n = 1
			competidor1.Cartas
			puts competidor1.inspect	
			while n != 0
				print "Escolha o atributo da sua carta #{name1}: "
				escolha = gets.chomp
				if escolha != 'velocidade' && escolha != 'altura' && escolha != 'peso' && escolha != 'força'
					puts 'Esse atributo não é válido, escolha outro'
					n = 1
				else
					n = 0
				end
			end
			competidor2.Cartas
			puts competidor2.inspect
			a = competidor1.duelar(competidor2, escolha.to_sym)
		  else
		  	competidor2.Cartas
			puts competidor2.inspect
			print "Escolha o atributo da sua carta #{name2}: "
			escolha = gets.chomp
			competidor1.Cartas
			puts competidor1.inspect
			a = competidor2.duelar(competidor1, escolha.to_sym)
		  end
		  i += 1
		end
		puts " "
		if competidor1.venceu > competidor2.venceu
			puts "O competidor #{competidor1.nome} venceu o jogo com #{competidor1.venceu} vitórias contra #{competidor2.venceu} do #{competidor2.nome}!!"
		elsif competidor1.venceu < competidor2.venceu
			puts "O competidor #{competidor2.nome} venceu o jogo com #{competidor2.venceu} vitórias contra #{competidor1.venceu} do #{competidor1.nome}!!"
		else
			puts'Os competidores empataram'
		end
		c = '0'

	elsif m == '2'
		print 'Digite seu nome competidor: '
		name1 = gets.chomp.capitalize
		puts 'Tente ganhar de mim ... Se Puder'
		puts 'Tabela com os valores máximos :'
		puts 'altura = 210     peso = 120     velocidade = 18     força = 100'
		competidor1 = Computador.new(name1)
		computador = Computador.new('Computador')
		i = 0
		a = "#{name1}"
		while(i < 31 && competidor1.venceu < 16 && computador.venceu < 16)
		  if a == "#{name1}"
			n = 1
			competidor1.Cartas
			puts competidor1.inspect	
			while n != 0 
				print "Escolha o atributo da sua carta #{name1}: "
				escolha = gets.chomp
				if escolha != 'velocidade' && escolha != 'altura' && escolha != 'peso' && escolha != 'força'
						puts 'Esse atributo não é válido, escolha outro'
						n = 1
					else
						n = 0
					end
			end
			computador.Cartas
			puts computador.inspect
			a = competidor1.duelar(computador, escolha.to_sym)
		  else
		  	computador.Cartas
			puts computador.inspect
			escolha = computador.EscolhaPC
			competidor1.Cartas
			puts competidor1.inspect
			a = computador.duelarPC(competidor1, escolha)
			print 'Pressione enter para continuar'
			aux = gets
		  end
		  i += 1
		end
		puts " "
		if competidor1.venceu > computador.venceu
			puts "Você me derrotou com #{competidor1.venceu} vitórias..."
			puts 'Como isso pode acontecer ...'
		elsif competidor1.venceu < computador.venceu
			puts "Eu venci o jogo com #{computador.venceu} vitórias!!"
			puts 'Essa foi fácil'
		else
			puts'Nós empatamos, parece que teremos que jogar mais uma para resolvermos isso'
		end
		c = '0'

	else
		puts 'Trunfo é um jogo muito simples, cada competidor tem 31 cartas, serão 31 rodadas, em cada rodada escolha um atributo e batalhe com seu adversário com esse atributo, o vencedor da última rodada que escolhe o atributo a ser batalhado.'
		puts 'No modo jogar com alguém, você joga com outra pessoa e o primeiro competidor que começa escolhendo o atributo.'
		puts 'No modo jogar contra o computador, voce joga contra o computador e pode começar escolhendo o primeiro atributo, mas tome cuidado, escolha bem para não cair na provocação do computador.'
		puts ' '
		puts 'Pressione 1 - Voltar ao menu anterior'
		puts 'Pressione 2 - Sair do jogo'
		c = gets.chomp
	end

	puts ' '
	while c != '1' && c != '2'
		puts 'Pressione 1 - Jogar De novo'
		puts 'Pressione 2 - Sair do jogo'
		c = gets.chomp
	end
end