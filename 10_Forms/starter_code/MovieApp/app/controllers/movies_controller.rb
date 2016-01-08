class MoviesController < ApplicationController
  before_action :load_movie, only: [:update, :edit, :show]


  def index
    @movies = Movie.search_for(params[:q])
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


  private
  def load_movie ()
    @movie = Movie.find(params[:id])
  end

 
end
