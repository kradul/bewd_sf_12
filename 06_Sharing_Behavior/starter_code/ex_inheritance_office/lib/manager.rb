require_relative 'employee'

# A manager is contactable by email,
# and wants their title as part of their name display
class Manager < Employee
	attr_accessor :title, :email
	
	def initialize (first_name, last_name, title, email)
		@title = title
		@email = email
		super("first_name", "last_name") + "#{@title}"
	end


	#make sure a Manager's full name includes their title

	#managers like to be contacted via email
	def contact()
		"Contact me via #{@email}"
	end
end
