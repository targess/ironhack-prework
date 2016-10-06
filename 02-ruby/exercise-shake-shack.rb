class Ingredient
  attr_reader :name, :price
  def initialize(name, price)
    @name = name
    @price = price
  end
end

class MilkShake
  def initialize
    @base_price = 3
    @ingredients = [ ]    
  end

  def add_ingredient(ingredient)
    @ingredients.push(ingredient)
  end

  def price_of_milkshake
  	#Let's establish what our counter should be before we start adding ingredients into the mix
  	total_price_of_milkshake = @base_price
  	#Add each ingredients price to our total
  	@ingredients.each do |ingredient|
    	total_price_of_milkshake += ingredient.price
  	end
  	#return  our total price to whoever called for it
   	total_price_of_milkshake
  end

end

class MilkShakeShop
	def initialize
		@milkshakes = [ ]
	end

	def add_milkshakes_to_list(milkshake)
		@milkshakes.push(milkshake)
	end

	def checkout
		#calculate the total price of milkshakes
		total_checkout = 0
		@milkshakes.each do |milkshake|
			total_checkout += milkshake.price_of_milkshake
		end
		total_checkout
	end

end

# create ingredients
banana = Ingredient.new("Banana", 2)
chocolate_chips = Ingredient.new("Chocolate Chips", 1)
coco = Ingredient.new("Coco",1)
vanilla = Ingredient.new("Vanilla",2) 
watermelon = Ingredient.new("Watermelon",1)

nizars_milkshake = MilkShake.new
nizars_milkshake.add_ingredient(banana)
nizars_milkshake.add_ingredient(chocolate_chips)

puts nizars_milkshake.price_of_milkshake

vanilla_milkshake = MilkShake.new
vanilla_milkshake.add_ingredient(vanilla)

puts vanilla_milkshake.price_of_milkshake

fruit_milkshake = MilkShake.new
fruit_milkshake.add_ingredient(banana)
fruit_milkshake.add_ingredient(coco)
fruit_milkshake.add_ingredient(watermelon)

puts fruit_milkshake.price_of_milkshake

# Add milkshakes to our list
milkshakes_list = MilkShakeShop.new
milkshakes_list.add_milkshakes_to_list(nizars_milkshake)
milkshakes_list.add_milkshakes_to_list(fruit_milkshake)
milkshakes_list.add_milkshakes_to_list(fruit_milkshake)

#chekout all milkshakes in our list
puts milkshakes_list.checkout




