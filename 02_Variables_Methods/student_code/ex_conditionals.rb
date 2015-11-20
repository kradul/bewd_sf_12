#Let's code our robot making a cake!

=begin
THE RECIPE:

The cake requires:
2 cups of flour
1 cup of sugar
2 cups of eggs (2 eggs, but just making it cups for consistency!)

Our robot is awesome and can make large cakes for more people,
The robot will ask how many servings of cake you want. 
=end

require "pry"

puts "How many servings of cake do you want?"
servings = gets.to_i

puts "Do you want chocolate cake? Please type: yes OR no\n
(Our robot is still in beta, it can't accept any other replies)"
chocolate = gets.downcase.chomp #downcase in case the user type "YES" or "Yes" instead of "yes" for consistency
	#chomp gets rid of whitespace

def add_ingredient bowl, ingredient, cups, servings
 bowl += ingredient + (cups*servings).to_s
end


def bake_cake servings
	#in the beginning the oven is off, and the bowl is empty
	oven_on = false
	bowl = ""
	#Step 1: turn on the oven
	oven_on = true
	puts "Is the oven on? " + oven_on.to_s

	bowl = add_ingredient bowl, "flour", 2, servings
	bowl = add_ingredient bowl, "sugar", 1, servings
	bowl = add_ingredient bowl, "egg", 2, servings

	#ADD a conditional statement, check to see if the user wants chocolate
	#IF the user wants chocolate, add chocolate! 1 cup per serving

	puts "The bowl currently has: " + bowl #should have all ingredients listed with the right quantities!

	#Let's ask the user if they liked our cake:
	puts "Did you like the cake? Please type: yes OR no\n
		(Our robot is still in beta, it can't accept any other replies)"

	#if the user liked it, tell them "I'm glad!"
	#otherwise, express your sadness that you have disappointed them...
end

bake_cake servings


