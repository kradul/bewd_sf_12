require 'pry'

#Apartment class.
class Apartment
<<<<<<< HEAD
	attr_accessor :unit, :rent, :sqft, :num_bedrooms, :num_bathrooms, :renter

	def initialize (unit, rent, sqft, num_bedrooms, num_bathrooms, renter)
		@unit = unit
		@rent = rent
		@sqft = sqft
		@num_bedrooms = num_bedrooms
		@num_bathrooms = num_bathrooms
		@renter = []
	end

	def apply_renter?(person)
	if person.creditscore > 600 && person.budget > rent
		puts "yes"
	else puts "no"
	end

	def add_renters(person)
		@renter.push(person)
=======
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
>>>>>>> d4d0371fc1b632c18c9608947c605083f5b631bb
	end
end
end








# 	attr_accessor :unit, :sqft, :num_bedrooms, :num_bathrooms, :rent, :renters

# 	def initialize (unit, sqft, bed, bath)
# 		@unit = unit
# 		@sqft = sqft
# 		@num_bedrooms = bed 
# 		@num_bathrooms = bath
# 		@rent = 0
# 		@renters = []
# end

# def to_s
# 	"Apartment: unit: #{@unit} has #{@sqft} sqft #{num_bedrooms} and #{num_bathrooms}"
# end

# def is_occupied?()
# 		@renters != []
# end

# def rent_out(price, tenant)
# 	@rent = price
# 	add_renter
# 	puts "#{@unit} has been rented out to #{tenant} for #{rent}"
# end

# def add_renter(tenant)
# 	@renters.push(tenant)
# end
