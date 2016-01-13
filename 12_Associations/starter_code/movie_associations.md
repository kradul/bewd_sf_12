
##Netflix Associations

###Task Instructions

*	Get into groups of two.
*	Draw a diagram that shows the associations for the following Netflix database tables.
	*	Movies
	*	Genres (Let's say a movie can only have 1 genre)
	*	Actors
*	Include the model's foreign and primary keys. 
*	(For many-to-many associations decide if you want a has_many :through or a has_and_belongs_to_many)

Now that you've drawn out the relationships and understand how the model should link to each other, let's implement this! Use the in-class reddit app as an example.

*	Create all the new models (Genre and Actor)
*	Add the associations 
	* add the associations in the model
	* add the associations in the migrations
* 	Migrate the database
* 	Use the rails console (```$ rails console```) or the seeds.rb file to add new Genres and Actors and connect them to a couple of Movies. (Don't worry about having accurate information, if you want "Actor 3" to be in "The Matrix" you can do that!) 
* 	Edit the view in MoviesApp so that each movie lists its genre. Make each genre a link, if you click on the genre it will display info about that genre including all the movies that belong to it.
* 	On the show movie page, have the movie list it's actors. Clicking on the actor should take you to an actor display page where it will list all the movies the actor is in (just like with genres).




