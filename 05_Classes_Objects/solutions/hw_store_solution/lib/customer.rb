#use this file to define a class that will represent a customer

class Customer
	attr_accessor :name, :money, :shopping_cart

	def initialize(name, money)
		@name = name
		@money = money
		@shopping_cart = {}
	end

	def add_to_cart (store, item, num)
		#code here
		#look up the item's price in the store
		price = store.inventory[item][:price]

		#make sure to update how many items are in the store

		#take items away from the store and find out how many we can buy
		#if you didn't do the bonus step, it's totally fine to just call store.decrease_item(item, num)
		#and use num in the rest of the code
		items_bought = store.decrease_item(item, num)

		#add the items to the customer	
		#check if customer already has the item
		if @shopping_cart[item]
			#if customer already has the item, 
			#ADD num more to the amount already in the cart
			@shopping_cart[item][:quantity] += items_bought
		else
			#if they don't have the item, just add the price and quantity info
			@shopping_cart[item] = {price: price, quantity: items_bought}
		end

		puts "#{@name} added #{num} #{item} to his cart. Here is their shopping cart:"
		puts @shopping_cart.to_s
	end

	def checkout(store)
		#sum up the total cost of all items in the cart
		#decrease the customer's money
		#clear the shopping cart (now the items are in the customer's fridge!)
		total_cost = 0
		@shopping_cart.each do |item, hash| 
			total_cost += hash[:price]*hash[:quantity]
		end

		if @money > total_cost
			@money -= total_cost
			@shopping_cart = {}
			puts "#{@name} spent #{total_cost} at #{store.name}"
		else
			@shopping_cart = {}
			puts "Insufficient Funds. Your shopping cart has been cleared."
		end
	end	



end