class StoriesController < ApplicationController
  def index
    @stories = params[:q] ? Story.search_for(params[:q]) : Story.all
  end

  def show
    @story = Story.find params[:id]
    @comment = Comment.new(:story => @story)
  end

  def new
    @story = Story.new
  end

  def create
    safe_story_params = params.require(:story).permit(:title, :link, :category)
    @story = Story.create(safe_story_params.merge(:upvotes => 1))

    if @story.save
      redirect_to @story
    else
      render :new
    end
  end

end
