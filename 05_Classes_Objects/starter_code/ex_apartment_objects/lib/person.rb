#Person Class.
<<<<<<< HEAD
class Person 
	attr_accessor :name, :budget, :creditscore
=======
class Person
	attr_accessor :name, :budget, :credit_score

	def initialize (name, budget, c_score)
		@name = name
		@budget =budget
		@credit_score = c_score
	end

	def to_s
		@name
	end
>>>>>>> d4d0371fc1b632c18c9608947c605083f5b631bb

	def initialize (name, budget, creditscore)
	@name = name
	@budget = budget
	@creditscore = creditscore
	end 
end

<<<<<<< HEAD

=======
>>>>>>> d4d0371fc1b632c18c9608947c605083f5b631bb
