class Collection
	def initialize(title, song_list)
		@song_list = song_list
		@title = title
	end

	def play ()
		self.play_list(@song_list)
	end

	def shuffle ()
		self.play_list(@song_list.shuffle)
	end

	def play_list (songs)
		songs.each do |s|
			puts "Playing song: #{s}"
		end
	end

end