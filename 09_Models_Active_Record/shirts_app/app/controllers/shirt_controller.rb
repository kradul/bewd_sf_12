class ShirtController < ApplicationController
  def show
  	@all_shirts = Shirt.all()
  end
end
