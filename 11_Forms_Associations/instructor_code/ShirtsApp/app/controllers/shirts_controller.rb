require 'pry'

class ShirtsController < ApplicationController
  before_action :load_shirt, only: [:edit, :show, :update]

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
    if @shirt.update(safe_shirt_params)
        #if the shirt was successfully saved, redirect to the show shirt page
      redirect_to @shirt
    else
        #if the shirt wasn't successfully saved, render the "new.html" view (allow user to edit it and try saving again)
      render 'edit'
    end
  end

  def show
  end

  private

  def safe_shirt_params
    #it's important to put restrictions on what parameters are allowed
    #(to help prevent malicious hacks)
    params.require('shirt').permit(:name, :description, :image)
  end

  def load_shirt
    @shirt = Shirt.find(params[:id])
  end

end
