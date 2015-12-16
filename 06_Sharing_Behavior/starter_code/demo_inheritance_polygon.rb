
#Most confusing thing is "super"
#Why would you use subclasses instead of just creating a new class?





class Polygon
	attr_accessor :len_sides #array storing length of each side

	def initialize(len_sides)
		@len_sides = len_sides #array storing the length of each side
	end

	def num_sides()
		@len_sides.length()
	end

	def is_regular()
		#check if all sides are the same length
		return @len_sides.uniq().empty?
	end

	def to_s()
		"This is a #{self.class} with #{num_sides()} sides."
	end
end


class Rectangle < Polygon #Rectangle is a subset of polygon (called a subclass)

	attr_accessor :length, :width

	def initialize(length, width) # this is used .new stuff
		@length = length
		@width = width
		super([length, width, length, width])
	end

	def area ()
		return @length * @width
	end

	def to_s ()
		super() + " It's length and width are #{@length}, #{@width}."
	end
end


class Square < Rectangle
	# def initialize(side)
	# 	super(side, side)
	# end
end
