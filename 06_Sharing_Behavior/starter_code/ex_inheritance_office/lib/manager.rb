require_relative 'employee'

# A manager is contactable by email,
# and wants their title as part of their name display
class Manager < Employee #subset of employee
	attr_accessor :first_name, :last_name, :title, :email

	def initialize (first_name, last_name, title, email)
		@title = title
		@email = email

		#@first_name = first_name
		#@last_name = last_name
		# incrementor
		super(first_name, last_name)
	end



	#managers have titles and emails

	#make sure a Manager's full name includes their title

	def full_name()
		super() + "#{title}"

	#managers like to be contacted via email
	def contact()
		puts "Send me an email"
	end
end
