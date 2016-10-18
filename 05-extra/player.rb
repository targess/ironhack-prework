class Player
	attr_reader :name, :word_to_guess

	def initialize (name = "")
		@name = name
		@letters = []
		@word_to_guess =""
	end

	def get_name
		puts "Hola, ¿cual es tu nombre?"
		@name = gets.chomp
	end

	def say_hello
		puts "hola #{@name}"
	end

	def get_word_to_guess
		puts "Indica una palabra que quieras que tu compañero adivine"
		@word_to_guess = gets.chomp
		system("clear")
	end

	def get_letter_to_guesses
		puts "Inidica una letra que creas que pertenece a la palabra a adivinar"
		@letters.push(gets.chomp)
		return @letters.last
	end

	def show_player_params
		puts "Hola #{@name}, la palabra a advivinar que hemos introducido es #{@word_to_guess}"
		puts "y la última letra indicada es #{@letters}"
	end
end