#First, lets use the sort default method just splitting the sentence into words.
#Now, after splitting the array remove punctuation characters.
#After that, change the sort method using a custom function that ignores cases when comparing words
#(you can compare both strings after calling upcase on them), but keeping the capitalized words as they were in the beginning .

def sort_case_insensitive (array_of_words)
	array_of_words.sort { |x,y| x.upcase <=> y.upcase}
end

def word_sorting (sentence)
	sentence = sentence.gsub(/[^a-zA-Z ]/,"")
	#print sentence.split(" ").sort
	print sort_case_insensitive(sentence.split(" "))
end

# word sorting removing punctuation characters afer splitting
def word_sorting_with_another_remove_punctuation (sentence)
	words_array = sentence.split(" ")

	clean_words_array = []
	words_array.each do |word|
		clean_words_array << word.gsub(/[^a-zA-Z ]/,"")
	end
	print clean_words_array.sort
end


word_sorting ("Have a nice day.")
word_sorting ("Fools fall for foolish follies.")

word_sorting_with_another_remove_punctuation("Have a nice day.")