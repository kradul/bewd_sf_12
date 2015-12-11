#iTunes!
require_relative "lib/album"

#We are going to write a very basic 

#code for testing, ignore this:
def assert_equal(expected, actual)
  unless expected == actual
    abort "Expected #{expected} to match #{actual} on line #{caller.first.split(":")[1]}"
  end
end

#Create an albums class that has a list of songs, title, artist, and genre
#(title, song_list, artist, genre)
wish_you = Album.new("Wish You Were Here", 
		["Shine On You Crazy Diamond I-IV", 
		"Welcome to the Machine",
		"Have a Cigar",
		"Wish You Were Here",
		"Shine On You Crazy Diamond V-VIII"],
	"Pink Floyd",
	"Rock")

assert_equal(wish_you.genre, "Rock")

puts "===================
Play wish you were here
==============="
#Make a method that "plays the album".
wish_you.play()
# => "Playing song: Shine On You Crazy Diamond I-IV"
# => "Playing song: Welcome to the Machine"
# => "Playing song: Have a Cigar"
# => "Playing song: Wish You Were Here"
# => "Playing song: Shine On You Crazy Diamond V-VIII"

puts "===================
Shuffle wish you were here
==============="
#Make a method that shuffles the songs then plays them
#Make sure your method doesn't change the album permanently
wish_you.shuffle()
# => "Playing song: Have a Cigar"
# => "Playing song: Wish You Were Here"
# => "Playing song: Shine On You Crazy Diamond I-IV"
# => "Playing song: Shine On You Crazy Diamond V-VIII"
# => "Playing song: Welcome to the Machine"
assert_equal(wish_you.song_list, ["Shine On You Crazy Diamond I-IV", 
		"Welcome to the Machine",
		"Have a Cigar",
		"Wish You Were Here",
		"Shine On You Crazy Diamond V-VIII"])

#iTunes also has playlists. Make a playlist class. 
#Make a new file in the lib folder for the Playlist class, make sure to add a new "require_relative"
sweet_tunes = Playlist.new("Sweet Tunes", 
	[ 	"Have a Cigar",
		"Here Comes the Sun",
		"Sound of Silence"
	])

=begin
Playlists can also be played and shuffled! 
Hmmm should you copy-paste the code from albums??? That wouldn't be very DRY
Maybe you should make a parent class! 
	Call it Collection. 
	Make sure it has it's own file and make sure to add all the necessary "require_relative"
=end

puts "===================
Play Sweet Tunes
==============="
sweet_tunes.play()
# => "Playing song: Have a Cigar"
# => "Playing song: Here Comes the Sun"
# => "Playing song: Sound of Silence"

puts "===================
Shuffle Sweet Tunes
==============="
#Try shuffling playlists:
sweet_tunes.shuffle()

#Edit album to ask the user (remember gets?) if they want to buy the album after they listen to it.
#Based on the user's answer print a message (see example).

#Album's play method should be just like the Collection play method but with an extra bit of code at the end....
#(hint use super)

puts "===================
Playing Wish you were here:
==============="
wish_you.play()
# => "Playing song: Have a Cigar"
# => "Playing song: Wish You Were Here"
# => "Playing song: Shine On You Crazy Diamond I-IV"
# => "Playing song: Shine On You Crazy Diamond V-VIII"
# => "Playing song: Welcome to the Machine"
# => "Would you like to buy this album? (y) or (n)"
# => "Thanks for buying this Wish You Were Here."
#OR
# => "Ok. Maybe buy it next time."

#add functionality on the playlist class to add and remove songs:
sweet_tunes.add_song("There She Goes")
assert_equal(sweet_tunes.song_list, [ 	"Have a Cigar",
		"Here Comes the Sun",
		"Sound of Silence",
		"There She Goes"
	])

#and remove songs:
sweet_tunes.remove_song("Have a Cigar")
assert_equal(sweet_tunes.song_list, [
		"Here Comes the Sun",
		"Sound of Silence",
		"There She Goes"
	])

puts "===================
Album help text:
==============="

#Add a class method to albums that explains to users about albums.
Album.help()
# => "Albums are created by an artist. And they have a genre."

puts "===================
Playlist help text:
==============="

Playlist.help()
# => "Playlists are created by the user."
# => "You can add songs and remove them."


#Practice creating a display method that's different for Playlists and Albums
#You can choose how exactly you want to display them, but make sure the user sees 
#all the important info about each one.

=begin 
========================
BONUS
========================
Make albums not editable.

Usually we want to be able to read and write all the properties of our class,
but this time we DON'T want people to be able to edit an album

HINT: what does "attr_accessor" do? Try removing it see what happens?

We still want to be able to /read/ the property, just not /write/ it. 
We want a method that lets us see what the artist of an album is, 
You can actually call the method just "artist" and do "album.artist()" or even "album.artist" 
that would return "Pink Floyd"

NOTE you may have to change the main code to work with this new method.

========================
SUPER EXTRA BONUS II 
========================
Make songs a class that stores info about each song:
title, artist, album_name, duration

Make playlists and albums able to tell the user their total play time
(total duration of all songs in their list)

=end