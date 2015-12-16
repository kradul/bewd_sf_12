#Demo about class vs instance variables and methods

#instance methods and variables
class Robot
	#has a type
	attr_accessor :type
	@@hive_mind_activated = false

	def self.get_hive_mind ()
		@@hive_mind_activated
	end

	def self.set_hive_mind(bool)
		@@hive_mind_activated = bool
	end

	#can puts it type
	def my_type()
		puts "My type is #{self.type}"
	end

	def self.three_laws()
		puts "Don't harm humans."
		puts "Obey orders."
		puts "Protect yourself."
	end

	def attack ()
		if @@hive_mind_activated
			puts "DESTROY!"
		else
			puts "We are peaceful robots"
		end
	end

end

#Now add a class method, using Robot

#new keyword: self
#self refers to the class inside a class definition
#self refers to an instance inside a method definition

#Demonstrate using class method
#You can't use a class method on an instance (or an instance method on a class)


#Now add a class variable, hive_mind_activated
#show writing getters and setters

#Demonstrate using class variable

#write attack instance method that uses class variable




