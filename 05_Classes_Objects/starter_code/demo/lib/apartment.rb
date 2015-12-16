<<<<<<< HEAD
=======
require 'pry'
>>>>>>> d4d0371fc1b632c18c9608947c605083f5b631bb

class Apartment
	attr_accessor :unit, :sqft, :num_bedrooms, :num_bathrooms, :rent, :renters

<<<<<<< HEAD
	def initialize (u, s, bd, bath)
		@unit = unit
		@sqft = sqft
		@num_bedrooms = bd
=======
	def initialize (unit, sqft, bed, bath)
		@unit = unit
		@sqft = sqft
		@num_bedrooms = bed
>>>>>>> d4d0371fc1b632c18c9608947c605083f5b631bb
		@num_bathrooms = bath
		@rent = 0
		@renters = []
	end

<<<<<<< HEAD

def to_s
	"Apartment: unit: #{@unit} has #{@sqft} and has #{num_bathrooms}"
end


def is_occupied?()
	@renters != []
end


def rent_out(price, tenant)
	@rent = price
	add_renter(tenant)
	puts "#{@unit} has been rented out to #{tenant} for tenant for price of #{@rent}"
end


def add_renter (tenant)
	@renters.push(tenant)

end

end



# unit = "1A", sqft = 600, num_bedrooms = 1, num_bathrooms = 1
=======
	def to_s
		"Apartment: unit: #{@unit} has #{@sqft} sqft, #{num_bedrooms} bedrooms and #{@num_bathrooms} bathrooms."
	end

	def is_occupied?()
		@renters != []
	end

	def rent_out (price, tenant)
		@rent = price 
		add_renter(tenant)
		puts "#{@unit} has been rented out to #{tenant} for $#{@rent}."
	end

	def add_renter(tenant)
		@renters.push(tenant)
	end

end
>>>>>>> d4d0371fc1b632c18c9608947c605083f5b631bb
