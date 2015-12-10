#Demo about class vs instance variables and methods
#instance methods and variables
class Robot
	attr_accessor :type
	@@hive_mind_activated = false

	# def initialize (type)
	# 	@type = type
	# end

	def my_type (type)
		puts self
		puts "My type is #{self.type}:"
	end

	def self.three_laws()
		puts "don't harm humans"
		puts "obey orders"
		puts "protect yourself"
	end


	def self.get_hive_mind ()
		#replaces attr_acessor
		@@hive_mind_activated 
	end

	def self.set_hive_mind (bool)
		@@hive_mind_activated = true
		# allows us to see if hive mind is activated or not
	end

	def attack ()

		if @@hive_mind_activated
			puts "destroy"
		else
			puts "we r peaceful"
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




