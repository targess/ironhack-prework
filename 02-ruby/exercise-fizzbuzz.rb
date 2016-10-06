 i = 1
while i<= 100
	value = ""

	if i % 3 == 0
  		value << "Fizz"
	end
	if i % 5 == 0
		value << "Buzz"
	end

	#split number to print Bang values
	i.to_s.split("").each do |item|
		if item == "1"
			value << "Bang"
		end
	end
	
	if value == ""
		value = i
	end
	puts value
	i = i + 1		
end
