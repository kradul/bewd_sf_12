require 'pry'

#Building Class
class Building
	attr_accessor :name, :address, :number_apartments, :apartments

	def initialize (name, address, number_apartments)
	@name = name
	@address = address
	@number_apartments = number_apartments
	@apartments = apartments
	end

def display_apartments
	apartments.each do |apartment|
		puts "Unit #{apartment.unit} has #{apartment.sqft} sqft, #{apartment.num_bedrooms} bed, #{apartment.num_bathrooms} bath, it's available!"
	end
end
end
