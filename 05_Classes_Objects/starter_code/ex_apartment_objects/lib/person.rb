#Person Class.
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

	attr_accessor :name, :budget, :credit

	def initialize (nam, budg, cred)
		@name = nam
		@budget = budg
		@credit = cred
	end       

end

