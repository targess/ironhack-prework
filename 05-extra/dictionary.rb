class Dictionary

	def load_file_with_dictionary(*library)
		if !library.empty?
			words_file = IO.readlines("dictionary/#{library.join}")
		else
			library = self.select_random_filename_from_directory
			words_file = IO.readlines("dictionary/#{library}")
		end
		return words_file
	end

	def select_element_from_array(array, min_size)
		element = array.sample
		while element.length < min_size
			element = array.sample
		end
		return element
	end

	def select_word_from_file(file)
		word = self.select_element_from_array(file, 7)
		return word.chomp.downcase
	end

	def select_random_filename_from_directory
		if Dir.exist?("dictionary")
			files = Dir.entries("dictionary")
			return select_element_from_array(files, 3)
		end
	end


end

# my_dictionary = Dictionary.new

# file = my_dictionary.load_file_with_dictionary
# word_to_guess = my_dictionary.select_word_from_file(file)
# puts word_to_guess
# puts word_to_guess.length