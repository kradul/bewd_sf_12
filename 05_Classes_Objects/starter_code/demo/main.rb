#Code Demo

#Read this file and figure out what properties and methods the Apartment class needs to have!

#This part is important, it's how this file has access to the definition of the Apartment class:
require_relative 'lib/apartment'

#create a new Apartment 
# unit = "1A", sqft = 600, num_bedrooms = 1, num_bathrooms = 1
a1 = Apartment.new("1A", 600, 1, 1)

puts "A new apartment has been created:"
puts a1.to_s()
# => "1A has 600 sqft and 0 renters."

puts "The current rent is: #{a1.rent}"
# => "The current rent is: 0"

puts "The current renters are: #{a1.renters}"
# => "The current renters are: []"

puts "Is the unit occupied?"
a1.is_occupied?
# => false

a1.rent_out(1700, "Alice")
# => "1A has been rented out to Alice for $1700"

#Alice has a roommate, Bob, let's add him to the house
a1.add_renter("Bob")
# => "Bob has been added to #{unit}."

puts "The current renters are: #{a1.renters}"
# => "The current renters are: [Alice, Bob]"

puts "Is the unit occupied?"
a1.is_occupied?
# => true


