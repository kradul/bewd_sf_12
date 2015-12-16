#use this file to define a class that will represent a customer

class Customer
	attr_accessor :name, :money, :shopping_cart

	def initialize(name, money)
		#code here
		@name = name
		@money = money
		@shopping_cart = {}
	end

	def add_to_cart (store, item, quantity)
		#code here

		@shopping_cart = shopping_cart.merge!(item_name => {:price => price, :quantity => quantity})

		#@shopping_cart = shopping_cart.merge!{item => {price: price, quantity: quantity} }


		#make sure to update how many items are in the store
		#What should happen if the store doesn't have enough?

		#update the shopping cart to show what the customer bought. 
	end

	def checkout (item_name)

		item_name.each do |price, quanity|
			total_cost = price*quanity +total_cost
		end

		@money = @money - total_cost

		@shopping_cart.clear #clears hash
		
		#sum up the total cost of all items in the cart
		#decrease the customer's money
		#clear the shopping cart (now the items are in the customer's fridge!)
	end	



end