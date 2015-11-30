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


#ask the user how many servings of cake they want
#HINT: use "puts"

#remember to store what they tell you
#HINT: use "gets" 
#HINT: they should tell you a number, but "gets" always gives you a string, 
# so use the method "to_i" to convert it to an integer
servings = 2

#USEFUL METHODS
#(remember this is just where the methods are DEFINED, they don't do anything until you CALL them later)
def add_flour bowl, servings
	#when you add flour to the bowl, add 2 cups per serving 
	#ex. if there are 3 servings of cake, and there was already 3 cups of sugar in the bowl
	# the bowl will now say "sugar3flour6"
	cups = 2 #cakes need 2 cups of flour per serving
	bowl += "flour" + (cups*servings).to_s 
end

#write the methods: add_sugar and add_egg
#remember to use the recipe at the beginning of the page to find out how many cups of each you need!
	

def bake_cake servings
	#in the beginning the oven is off, and the bowl is empty
	oven_on = false
	bowl = ""
	#Step 1: turn on the oven

	puts "Is the oven on? " + oven_on.to_s

	#Step 2: add flour, add eggs, add sugar

	puts "The bowl currently has: " + bowl #should have all ingredients listed with the right quantities!
	
end

=begin
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
============BONUS EXERCISE===================
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

Remember Abstraction and the DRY princicple?

The current code could be better, it's not as DRY as it could be....
Did you notice that you used copy/paste when you wrote the add_sugar and add_egg methods?

Write a SINGLE method that could be used to add ANY ingredient! call it "add_ingredient" (so creative!)

What parameters (inputs) does it need?

Update the bake_cake method to use this new "add_ingredient" method.

=end


#What happens if you comment out this line? Why does this happen?
bake_cake servings


