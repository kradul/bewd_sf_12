![GeneralAssemb.ly](http://studio.generalassemb.ly/GA_Slide_Assets/Exercise_icon_md.png)


#Movie App

Our client RetFlix wants BEWDiful students to develop an app for them. 

They want an application that allows visitors to:

*	View all movies in the database. 
*	Add a new movie to the database.
*	Edit a movie in the database. 
*	And search for a specific movie.

We will build a Rails app for RetFlix.

Paring is Sharing, and happy coding :)

##Set up Movies 
*	Remember ```rake db:migrate``` (to set up your tables)?

*	What about filling the movie data? The movies app already comes with movies in the seed file (just open db/seeds.rb and check it out). Try ```rake db:seed``` to fill the database with movies.


*	Update routes file (note, you can use ```resources :shirts``` to automatically create CRUD routes for the shirts resource.)

##Search Movies 
####Time: 15 min

###Task Instructions

*	Create a search box that will search for a term in the title, description and the year released fields.
*	Display results in the search.html.erb pages.


##Lab Time - Create & Edit Movie Forms
####Time: Due Lesson 11

###Task Instructions


*	Add a link to show just the movie that was clicked

*	Build form for adding a new movie

*	Add validations to the Movie model (check the bottom of the notes for a validations cheat sheet)
	*	All titles and descriptions must be present
	*	Descriptions must be greater than 10 characters
	*	Year released must be a number greater than 0
	*	Rating must be a number between 1 and 5

*	Set messages to show up if a movie doesn't save

* 	Add ability to edit Movies, make sure to reuse the form for creation, use the shirts app as an example


Google is your friend!

__Best Practices__

*	Keep code DRY: Create partials so you can reuse code. 
*	Move all complex data queries to the model





	