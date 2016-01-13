require_relative "collection"

class Album < Collection
	def initialize(title, song_list, artist, genre)
		@song_list = song_list
		@title = title
		@artist = artist
		@genre = genre
	end

	def title ()
		@title
	end 

	def song_list ()
		@song_list
	end 

	def artist ()
		@artist
	end 

	def genre ()
		@genre
	end 

	def play()
		super()
		puts "Would you like to buy this album? (y) or (n)"
		response = gets.chomp
		if response == 'y'
			puts "Thanks for buying #{@title}"
		else
			puts "Ok. Maybe buy it next time."
		end
	end

	def self.help ()
		puts "Albums are created by an artist. And they have a genre."
		puts "They are not editable by the user."
	end

end