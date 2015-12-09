


class Photo
	attr_reader :photographer, :resolution, :upvotes

	def initialize(photographer, resolution)
		@photographer = photographer
		@resolution = resolution
		@upvotes = 1
	end

	def upvote! ()
		@upvotes += 1
	end

	def downvote! ()
		@upvotes -= 1
	end
end

class Story
	attr_reader :title, :author, :upvotes

	def initialize(title, author)
		@title = title
		@author = author
		@upvotes = 1
	end

	def upvote! ()
		@upvotes += 1
	end

	def downvote! ()
		@upvotes -= 1
	end
end
