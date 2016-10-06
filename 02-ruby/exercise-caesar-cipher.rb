# limitado a valores enre -26 y +26. En caso de aplicar un cambio fuera de este rango, el sistema produce un error.

def ignore_special_characters(value)
	
	if value >= 97 && value <= 122
		value
	elsif value < 97
	 	 value + 26
	elsif value > 122
	 	value - 26
	end
end

def limit_shift_size(shift_size)
	if shift_size > 26
		#shift_size - 26
		shift_size%26
	elsif shift_size < -26
		#shift_size + 26
		shift_size % (-26)
	else shift_size
	end
end

def solve_cipher(input,shift_size = 3)
	array_of_letters = input.split("")
	result = ""
	array_of_letters.each do |item|
		if item.ord == 32
			result = result + " "
		else
			result = result + (item.ord + shift_size).chr
		end
	end
	puts result
end

def solve_cipher_without_special_characters(input,shift_size = 3)
	array_of_codes = input.downcase.codepoints
	result = ""
	shift_size = limit_shift_size(shift_size)

	array_of_codes.each do |item|
		if item == 32
			result = result + " "
		else
			result = result + ignore_special_characters(item.ord + shift_size).chr
		end
	end
	puts result
end

solve_cipher("ifmmp",-1)
# solve_cipher("p| uhdo qdph lv grqdog gxfn", -3)
# solve_cipher_without_special_characters("abcdefghijklmnopqrstuvwxyz", -16)
# solve_cipher_without_special_characters("abcdefghijklmnopqrstuvwxyz", -42)

solve_cipher_without_special_characters("p| uhdo qdph lv grqdog gxfn", -3)
solve_cipher_without_special_characters("p| uhdo qdph lv grqdog gxfn", -29)
solve_cipher_without_special_characters("p| uhdo qdph lv grqdog gxfn", -81)
solve_cipher_without_special_characters("abcdefghijklmnopqrstuvwxyz", -16)
solve_cipher_without_special_characters("ABCDEFGHIJKLMNOPQRSTUVWXYZ", 5)


