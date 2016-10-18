class Game
	attr_reader :opportunities, :guessed_letters

	def initialize
		@players = []
		@opportunities = 6
		@guessed_letters = []
		@word_to_guess = ""
	end

	def start_game
		self.show_instructions

		puts "select number of players 1 or 2"
		players = gets.chomp.to_i
		if players == 2
			two_players_mode
			puts "two players"
		else
			forever_alone_mode
			puts "forever alone"
		end

		self.show_actual_players
		@players[1].get_word_to_guess
		self.set_word_to_guess
		self.init_guessed_letters(@word_to_guess)
		self.game_turn
	end

	def init_guessed_letters (word)
		word.split("").each_index do |index| 
			if word[index] == " "
				@guessed_letters[index] = " "
			else
				@guessed_letters[index] = "_"
			end
		end
	end

	def two_players_mode
		puts "two players mode"
		first_player = Player.new
		first_player.get_name
		self.add_player(first_player)

		second_player = Player.new("Manué")
		self.add_player(second_player)
	end

	def forever_alone_mode
		first_player = Player.new("Luis")
		self.add_player(first_player)

		ia_player = IAplayer.new
		self.add_player(ia_player)
	end

	def game_turn
		principal_player = @players[1]

		while !self.check_game_over
			letter_try = principal_player.get_letter_to_guesses
			self.compare_letter_with_word(letter_try, @word_to_guess)
			self.show_word_to_guessed_status
		end
	end

	def show_actual_players
		index = 1

		puts " - Listado actual de jugadores:" 
		@players.each do |player|
			puts "#{index} - #{player.name}"
			index += 1
		end
	end

	def show_instructions
		puts " - Bien, vamos a comenzar!"
		puts " - El jugador 1 introduce una letras para intentar adivinar la palabra"
		puts " - hasta que acierte, o cometa seis fallos."
		puts " - El jugador 2 debe indicar la frase a adivinar."
		puts " - En caso de ser un solo jugador, la IA definirá la palabra a adivinar"
	end


	def add_player(player)
		@players.push(player)
	end

	def reduce_opportunities
		@opportunities -= 1
		puts " - Te quedan #{@opportunities} intentos."
	end

	def compare_letter_with_word (letter, word)
		index = 0
		letter_ok = false

		word.split("").each do |letter_to_guess|

			if letter_to_guess == letter
				guessed_letters[index] = letter
				letter_ok = true
			end	
			index += 1
		end

		if !letter_ok 
			reduce_opportunities
		end
	end

	def show_word_to_guessed_status
		puts " - Letras adivinadas: #{@guessed_letters.join("")}"
	end

	def check_game_over
		if (@opportunities == 0)
			puts "Game Over - the word to discover was #{@word_to_guess}"
			return true
		elsif @guessed_letters.join("") == @word_to_guess
			puts "Game Over - Congrats"
			return true
		end
			
		return false
	end

	def set_word_to_guess
		@word_to_guess = @players[1].word_to_guess
	end
end

