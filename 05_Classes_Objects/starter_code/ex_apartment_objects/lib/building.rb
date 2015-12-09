require 'pry'

#Building Class
class Building
<<<<<<< HEAD
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
=======
	attr_accessor :name, :address, :num_apartments, :apartments

	def initialize(name, address, num_apartments)
		@name = name
		@address = address
		@num_apartments = num_apartments
		@apartments = []
	end

	def display_apartments() 
		@apartments.each do |a|
			available_text = a.is_occupied?() ? "it's taken." : "it's available!"
			puts "Unit #{a.unit} has #{a.sqft} sqft, #{a.num_bedrooms} bed, #{a.num_bathrooms} bath, #{available_text}"
		end
	end
>>>>>>> d4d0371fc1b632c18c9608947c605083f5b631bb
end

