require_relative 'employee'
require_relative 'manager'


# A manager is contactable by email,
# and wants their title as part of their name display
class Marketer < Employee #subset of employee
	attr_accessor :first_name, :last_name, :twitter

	def initialize (first_name, last_name, twitter)
		@twitter = twitter
		super(first_name, last_name)
	end

	def full_name()
		super() + "#{title}"

	#marketer like to be contacted via twitter
	def contact()
	"contact me via twitter"

end
