class MovieController < ApplicationController
  def index
  	@all_movie = Movie.all()
  end
end
