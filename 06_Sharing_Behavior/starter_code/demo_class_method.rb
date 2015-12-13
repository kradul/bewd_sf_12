require 'pry'

#Demo about class vs instance variables and methods

#instance methods and variables
#has a type
	
class Robot
	attr_accessor :type
	#Now add a class variable, hive_mind_activated
	@@hive_mind_activated = true
	# attr_accessor doesn't work for class methods so you need to write your own method for that

	def self.get_hive_mind()
		@@hive_mind_activated
	end

	def self.set_hive_mind(bool)
		@@hive_mind_activated = bool
	end
	
	def initialize
		@type = type
	end

	#can puts its type
	def my_type()
		# puts self => would put that call the method variable my_type
		puts "My type is #{@type}"
	end

#Now add a class method, using Robot
#new keyword: self

#self refers to the class inside a class definition
#self refers to an instance inside a method definition

	def self.three_laws()
		puts "Don't harm humans."
		puts "Obey orders."
		puts "Protect yourself."
	end

	def attack ()
		if @@hive_mind_activated
			puts "DESTROY"
		else puts "We are peaceful robots"
		end
		end
end


#Demonstrate using class method
#You can't use a class method on an instance (or an instance method on a class)



#show writing getters and setters

#Demonstrate using class variable

#write attack instance method that uses class variable




