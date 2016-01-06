require 'pry'

class ShirtsController < ApplicationController

  def index
    @shirts = Shirt.all()
  end

  def new
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
