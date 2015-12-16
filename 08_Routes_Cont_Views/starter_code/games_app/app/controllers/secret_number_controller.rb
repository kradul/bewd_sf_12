class SecretNumberController < ApplicationController
  def new
  end

  def show
  	#random number from 0 to 5
  	@secret_num = rand(5) + 1

  	#user's guess:
  	@guess = params[:format].to_i

  	@win = @guess == @secret_num

  	@p = params
  end
end
