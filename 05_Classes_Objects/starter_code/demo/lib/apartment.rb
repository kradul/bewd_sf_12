
class Apartment
	attr_accessor :unit, :sqft, :num_bedrooms, :num_bathrooms, :rent, :renters

	def initialize (u, s, bd, bath)
		@unit = unit
		@sqft = sqft
		@num_bedrooms = bd
		@num_bathrooms = bath
		@rent = 0
		@renters = []
	end


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
