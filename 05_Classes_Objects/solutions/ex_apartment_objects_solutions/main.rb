require_relative 'lib/building'
require_relative 'lib/apartment'
require_relative 'lib/person'
=begin
Read this file and use it to understand how to fill in each class file
(Apartment, Building and Person) in the lib folder

This file has examples of methods and properties that each class should have.

When a method is called, below you will see a commented out version of 
what it should print out and return
=end

#Create a new apartment with unit, rent, sqft, num_bedrooms, num_bathrooms
#Notice this is a little different from the demo, this time the rent doesn't start at 0
a1 = Apartment.new("1A", 800, 600, 1, 1)
a2 = Apartment.new("1B", 1400, 900, 2, 1)
a3 = Apartment.new("2A", 2000, 1200, 3, 2)

#Create a new building with this name, address and number of apartments
building = Building.new("Forest Lofts", "125 Elm St", 3)

#set the building's apartments
building.apartments = [a1, a2, a3]

#display the building's apartments
puts "The building #{building.name} has the following apartments:"
building.display_apartments() 
# "Unit 1A has 600 sqft, 1 bed, 1 bath, it's available!"
# "Unit 1B has 1400 sqft, 2 bed, 1 bath, it's available!"
# "Unit 2A has 2000 sqft, 3 bed, 2 bath, it's available!"
# => nil

#create a renter with name, a budget, and a credit score
steve = new Person("Steve", 1000, 650)

puts "Now Steve wants to rent an apartment."

#Renters can apply for an apartment
#A renter is approved if:
#  * their credit score is above 600
#  AND
#  * their budget is larger than the rent for the apartment

puts "Steve wants to apply for Unit A2. Is he eligible?"
#let's see if Steve can rent apartment a2?
a2.apply_renter?(steve)
# => false

puts "Now Steve wants to apply for Unit A1. Is he eligible?"
a1.apply_renter?(steve)
# => true

puts "Wonderful! Now Steve rents the apartment."
a1.add_renter(steve)

a1.show_renters()
# "Unit A1 has these renters: [Steve]"

#display the building's apartments
puts "The building #{building.name} has the following apartments:"
building.display_apartments() 
# "Unit 1A has 600 sqft, 1 bed, 1 bath, it's taken."
# "Unit 1B has 1400 sqft, 2 bed, 1 bath, it's available!"
# "Unit 2A has 2000 sqft, 3 bed, 2 bath, it's available!"
# => nil




