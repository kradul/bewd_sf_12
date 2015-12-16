=begin
We will use classes to make a program about shoppers buying things at a grocery store.

Read this file and use it to understand what classes to create and 
what methods each class should have

When you create a new class, each class should have a separate file named 
after the class and located in the lib directory.

This file has examples of methods and properties that each class should have.

When a method is called, below you will see a commented out version of 
what it should print out and return

HINTS: If you are stuck, check out hints_lib folder which will have an outline of
how to structure your code and which methods you need to define.

=end

require 'pry'

###
#HINT: you need to use require_relative here
###
require_relative 'lib/grocerystore'
require_relative 'lib/customer'

#create a new grocery store named Safeway
safeway = GroceryStore.new("Safeway")

#stock safeway with 5 bananas that cost 1 dollar each
#Safeway stores it's items as a hash of hashes like this:
# => inventory = { 'banana'=> {price: 1, quantity: 5} }
#USE THE STRING "banana" as the KEY (not a symbol, it just makes it easier later)
safeway.stock_item('banana', 1, 5)

safeway.stock_item('oatmeal', 2, 10)
safeway.stock_item('chocolate', 1.50 , 2)

safeway.view_item('banana')
# => "Safeway has 5 bananas for 1 dollar each."

#create a new customer named Jack who has $10
jack = Customer.new("Jack", 10)

#currently jack has no items:
jack.shopping_cart
# => {}

#jack wants to buy one banana from safeway:
#remember to update how many bananas the store has left!!
#also remember to check if jack already had any bananas in his cart
jack.add_to_cart(safeway, 'banana', 1)
# => "Jack added 1 banana to his cart. Here is his shopping cart:"
#   { "banana" => {price: 1, quantity: 1} }

jack.add_to_cart(safeway, 'chocolate', 2)

jack.checkout(safeway)
# => "Jack spent $4 at Safeway"
#remember to decrease jack's money (since he spent it) and also clear Jack's cart.


#Jack goes shopping again! He forgot oatmeal.

#he adds 6 oatmeal packages to their cart
jack.add_to_cart(safeway, 'oatmeal', 6)

#but when he tries to check out, he doesn't have enough money!
jack.checkout(safeway)
# => "Insufficient Funds. Your shopping cart has been cleared."

=begin
#BONUS 

Implement better edge-case handling. Right now jack could buy 10 bananas 
even if the store has 2. Then the store has -8 bananas! Let's fix that:

#jack tries to buy 10 chocolate bars, but the store only has 2
#give jack 2 and tell him there isn't enough for 10
jack.add_to_cart(safeway, 'chocolate', 10)
# => "Jack added 2 chocolate to his cart. Here is their shopping cart:"
#   { "banana" => {price: 1, quantity: 1},
#	 "chocolate" => {price: 1.50, quantity: 2}}
# => "Safeway ran out of chocolate."



Write a method for a customer to remove an item from their shopping cart

=end


