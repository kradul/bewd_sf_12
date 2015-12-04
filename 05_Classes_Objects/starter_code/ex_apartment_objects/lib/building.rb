#Building Class
class Building
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
end

