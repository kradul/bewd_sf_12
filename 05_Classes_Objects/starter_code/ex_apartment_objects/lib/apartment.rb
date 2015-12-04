#Apartment class.
class Apartment
	attr_accessor :unit, :sqft, :num_bedrooms, :num_bathrooms, :rent, :renters

	def initialize (unit, rent, sqft, bed, bath)
		@unit = unit
		@sqft = sqft
		@num_bedrooms = bed
		@num_bathrooms = bath
		@rent = rent
		@renters = []
	end

	def to_s
		"Unit: #{@unit} has #{@sqft} sqft, #{num_bedrooms} bed, #{@num_bathrooms} bath"
	end

	def is_occupied?()
		@renters != []
	end

	def apply_renter?(renter)
		renter.credit_score > 600 && renter.budget >= @rent
	end

	def add_renter(tenant)
		@renters.push(tenant)
	end

	def show_renters()
		puts "Unit #{@unit} has these renters: [#{@renters.join(",")}]"
	end
end
