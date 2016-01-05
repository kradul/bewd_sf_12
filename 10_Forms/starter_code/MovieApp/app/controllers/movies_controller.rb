class MoviesController < ApplicationController
  before_action :load_movie, only: [:update, :edit, :show]

  def index
    @movies = Movie.all()
  end

  def new
    @movie = Movie.new()
  end

  def create
  
  end

  def edit
  end

  def update
    
  end

  def show
  end

 
end
