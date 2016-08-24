#use this file to define a class that will represent a grocery store 


# 1.) Class have methods as well as variables.  Hashes when you want to store data and don't need other methods.
# 2.) class vs. instance? [a method in a class class can be called on anything in the class, whereas an instance can be called on something in a method?]
# 3.) instance variable = variable defined in a class [@ sign in front]
# 4.) attr_acessor = attribute accessor from other files


class GroceryStore
	attr_accessor :name, :inventory #allows you to use the "."

	def initialize (name)
		@name = name
		@inventory = {}
	end

	def stock_item (item_name, price, quantity)

		@inventory = inventory.merge!(item_name => {:price => price, :quantity => quantity})
	end

	def view_item (item_name)
		puts "At safeway for a #{item_name}:"
		inventory[item_name].each do |key, value| 
			puts  "#{key} is #{value}" 
		end


	end
	def decrease_item (item_name, num)

		inventory.item_name = inventory.item_name - sold.item_name


		#this happens when a customer adds an item to their cart, 
		#the store now has some number less of the item!
		#example: if num = 2, the customer bought 2 items
		# update the quantity in the inventory

		#if you do the bonus, you should return the number of items the customer could buy
		#that would be either the num or the amount the store had
	end
	
end