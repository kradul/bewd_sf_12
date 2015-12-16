
class Polygon
	attr_accessor :len_sides

	def initialize(len_sides)
		@len_sides = len_sides #array storing the length of each side
	end

	def num_sides()
		@len_sides.length()
	end

	def is_regular()
		@len_sides.uniq().length == 1
	end

	def to_s()
		"This is a #{self.class} with #{num_sides()} sides."
	end
end


class Rectangle < Polygon
	attr_accessor :l, :w

	def initialize (length, width)
		@l = length
		@w = width
		@len_sides = [length, width, length, width]
	end

	def area ()
		@l * @w
	end

	def to_s ()
		super() + " I have area #{self.area()}"
	end

end


class Square < Rectangle
	def initialize(side)
		super(side, side)
	end
end
