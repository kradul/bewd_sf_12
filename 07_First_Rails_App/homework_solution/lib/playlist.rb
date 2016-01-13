require_relative "collection"

class Playlist < Collection
	attr_accessor :song_list, :title

	def add_song (song)
		@song_list.push(song)
	end

	def remove_song (song)
		@song_list.delete(song)
	end

	def self.help ()
		puts "Playlists are created by the user."
		puts "You can edit their songs and titles."
	end

end