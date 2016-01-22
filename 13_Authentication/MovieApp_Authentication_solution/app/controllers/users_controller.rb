require 'pry'

class UsersController < ApplicationController
  def show_movies
  	#remember Devise provides the useful "current_user" variable!
  	@movies = current_user.movies 
  end

  def add_movie
  	#find the id associated with this request, this is the movie id
  	# (see where this is called, in _list.html)
  	movie = Movie.find(params[:id])
  	#check if the movie is in the list, if it's not, add it
  	if !current_user.movies.include? movie
  		#add the movie to the current_user's movies
	  	current_user.movies.push(movie)
	  	#make sure to save to the DB!
	  	current_user.save()
	end 

	#need to have this redirect because this action is not associated with it's own view
	#take users to the home page!
  	redirect_to root_path, alert: "#{movie.title} has been added to your watchlist."
  end

  def remove_movie
  	movie = Movie.find(params[:id])
  	if current_user.movies.include? movie
	  	current_user.movies.delete(movie) 
	  	current_user.save()
	end 
  	redirect_to root_path, alert: "#{movie.title} has been removed from your watchlist."
  end
end
