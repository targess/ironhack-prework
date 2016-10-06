class Item
	def initialize (name, price)
		@name = name
		@price = price
	end

	def price
		@price
	end
end

class Houseware < Item
	def price
		if @price > 100
			# set 5% discount
			@price * 0.95
		else @price
		end
	end

end

class Fruit < Item
	def price
		# get actual Time
		t = Time.now
		# check if we are at weekend to apply discount
		if t.saturday? || t.sunday?
			@price * 0.90
		else
			@price
		end
	end
end


class ShoppingCart
	
	def initialize
		@items = []
	end

	def add_item(item)
		@items.push(item)
	end

	def checkout
		total_checkout = 0
		@items.each do |item|
			total_checkout += item.price
		end

		# special discount if we have more than 5 items in the cart
		if @items.count > 5
			total_checkout *= 0.90
		end
		puts "Your total today is €#{total_checkout}. Have a nice day! "
	end

end

banana = Fruit.new("Banana", 10)
orange_juice = Fruit.new("Orange Juice", 10)
rice = Item.new("Rice",1)
vacuum_cleaner = Houseware.new("Vacuum Cleaner",150)
anchovies = Item.new("Anchovies",2)


# Joshs Shopping Cart
joshs_cart = ShoppingCart.new

joshs_cart.add_item(orange_juice)
joshs_cart.add_item(rice)
joshs_cart.checkout
# Your total today is $11. Have a nice day!


# Create our ShoppingCart
jose_cart = ShoppingCart.new
jose_cart.add_item(banana)
jose_cart.add_item(banana)
jose_cart.add_item(banana)
jose_cart.add_item(orange_juice)
jose_cart.add_item(rice)
jose_cart.add_item(vacuum_cleaner)
jose_cart.checkout
