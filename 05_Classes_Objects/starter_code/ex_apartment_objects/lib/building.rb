#Building Class
class Building
	attr_accessor :name, :addy, :num_apt, :apartments

	def initialize (nam, ad, num_ap)
		@name = nam
		@addy = ad
		@num_apt = num_ap
		@apartments = []
	end




	def add_apartment (apartment)
		@apartments << apartment
	end

end
