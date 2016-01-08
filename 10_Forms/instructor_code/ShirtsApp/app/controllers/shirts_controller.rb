require 'pry'

class ShirtsController < ApplicationController

  def index
    @shirts = Shirt.search_for(params[:q])
  end

  def new
    @shirt = Shirt.new()
  end

  def create
    @shirt = Shirt.new(safe_shirt_params)
    if @shirt.save()
        #if the shirt was successfully saved, redirect to the show shirt page
      redirect_to @shirt
    else
        #if the shirt wasn't successfully saved, render the "new.html" view (allow user to edit it and try saving again)
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def show
    @shirt = Shirt.find(params[:id])
  end

  private

  def safe_shirt_params
    #it's important to put restrictions on what parameters are allowed
    #(to help prevent malicious hacks)
    params.require('shirt').permit(:name, :description, :image)
  end

end
