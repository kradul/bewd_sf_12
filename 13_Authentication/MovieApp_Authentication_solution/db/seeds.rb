puts "Adding a Whole bunch of movies"

matrix = Movie.create(title: "The Matrix",
    description: "Playing videogames can teach you kung-fu",
    year_released: 1999)

lotr1 = Movie.create(title: "The Lord of the Rings: The Fellowship of the Ring",
    description: "More Hobbits",
    year_released: 2001)

lotr2 = Movie.create(title: "The Lord of the Rings: The Two Towers",
    description: "Again with the Hobbits and their jewelry obsession",
    year_released: 2002)

lotr3 = Movie.create(title: "The Lord of the Rings: The Return of the King",
    description: "Something to do with Hobbits",
    year_released: 2003)

fightclub = Movie.create( title: "Fight Club",
    description: "This is your life... Apparently it's really easy to make explosives",
    year_released: 1999)

Movie.create [
  {
    title: "The Shawshank Redemption",
    description: "Morgan Freeman in Jail",
    year_released: 1994
  },
  {
    title: "The Godfather",
    description: "Hard core Gangster activity",
    year_released: 1972
  },
  {
    title: "The Godfather: Part II",
    description: "More Gangsters, aw yea",
    year_released: 1974
  },
  {
    title: "Pulp Fiction",
    description: "Samuel Jackson screams a LOT! Say What again!",
    year_released: 1994
  },
  {
    title: "The Good, the Bad and the Ugly",
    description: "Cowboys will be cowboys",
    year_released: 1966
  },
  {
    title: "12 Angry Men",
    description: "Really old movie about a court case. They have anger issues",
    year_released: 1957
  },
  {
    title: "The Dark Knight",
    description: "Batman (not a super hero), battles the joker for who can have the most not normal voice ever",
    year_released: 2008
  },
  {
    title: "Schindler's List",
    description: "It's about the Holocaust I think",
    year_released: 1993
  },
  {
    title: "Star Wars: Episode V - The Empire Strikes Back",
    description: "The best Star Wars EVER",
    year_released: 1980
  },
  {
    title: "One Flew Over the Cuckoo's Nest",
    description: "Crazy guy does crazy stuff",
    year_released: 1975
  },
  {
    title: "Inception",
    description: "Dream in a dream, in a nap, in a dozing off in class",
    year_released: 2010
  },
  {
    title: "Goodfellas",
    description: "I think Joe Pesci is in this one",
    year_released: 1990
  },
  {
    title: "Star Wars",
    description: "Let the Wookie win",
    year_released: 1977
  },
  {
    title: "Seven Samurai",
    description: "One of the best films ever made... according to Wikipedia",
    year_released: 1954
  },
  {
    title: "Forrest Gump",
    description: "Life is like a box of chocolates. It will give you diabetes",
    year_released: 1994
  }]



puts "Creating genres..."

horror = Genre.create(title: "Horror")
comedy = Genre.create(title: "Comedy")
drama = Genre.create(title: "Drama")
romance = Genre.create(title: "Romance")
action = Genre.create(title: "Action")

puts "Creating Actors...."

kr = Actor.create(name: "Keanu Reeves")
lf = Actor.create(name: "Laurence Fishburne")
bp = Actor.create(name: "Brad Pitt")
ew = Actor.create(name: "Elijah Wood")
sa = Actor.create(name: "Sean Astin")

puts "Creating Movie/Genre associations"
lotr1.genre = action
lotr1.save()
lotr2.genre = action
lotr2.save()
lotr3.genre = action
lotr3.save()
matrix.genre = action
matrix.save()
fightclub.genre = drama
fightclub.save()


puts "Creating Movie/Actor associations"
matrix.actors = [kr, lf]
matrix.save()

lotr1.actors = [ew, sa]
lotr1.save()
lotr2.actors = [ew, sa]
lotr2.save()
lotr3.actors = [ew, sa]
lotr3.save()







