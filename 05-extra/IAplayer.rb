class IAplayer < Player
	def initialize (*dictionary_name)
		@name = "IA Player"
		@letters = []
		@word_to_guess =""
		@dictionary_name = dictionary_name
	end

	def get_word_to_guess
		new_dictionary = Dictionary.new
		if @dictionary_name.empty?
			file = new_dictionary.load_file_with_dictionary
		else
			file = new_dictionary.load_file_with_dictionary(@dictionary_name)
		end
		@word_to_guess = new_dictionary.select_word_from_file(file)
	end
end