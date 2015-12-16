#use this file to define a class that will represent a grocery store 

require 'pry'

class GroceryStore
	attr_accessor :name, :inventory

	def initialize (name)
		@name = name
		@inventory = {}
	end

	def stock_item (item_name, price, quantity)
		#add an item with a certain price to the inventory hash
		#inventory stores: item name as the key and a hash of price and quantity as the value 
		#Ex inventory = { 'banana' => {price: 1, quantity: 5},
		# 				'oatmeal' => {price: 2, quantity: 10} }

		@inventory[item_name] = {price: price, quantity:quantity}
	end

	def view_item (item_name)
		#puts the information the inventory has about the item (price and quantity)
		item = @inventory[item_name]
		puts "#{@name} has #{item[:quantity]} #{item_name} for #{item[:price]} dollar each." 
	end

	def decrease_item (item_name, num)
		# update the quantity in the inventory
		@inventory[item_name][:quantity] -= num

		#returns the number of items the customer can have
		return num
	end

=begin
BONUS version that makes sure you can't buy more items than the store has

	def decrease_item (item_name, num)
		available_items = store[item][quantity:]
		#this represents the number of items the customer can have
		#either the number they wanted or the number available in the store
		items_bought = num 

		if available_items < num
			items_bought = available_items
			#the store doesn't have enough of the item!
			puts "#{store[:name]} does now have enough of #{item}."
		end

		# update the quantity in the inventory
		@inventory[item_name][:quantity] -= items_bought

		#returns the number of items the customer can have
		return items_bought
	end
=end
	
end