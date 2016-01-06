require 'pry'

class SecretNumbersController < ApplicationController
  def show
    # get a random number from 1-5
    @secret_number = rand(5)+1

    # get the user chosen number from params
    # the param is named 'id' because of route convention
    # lastly, we want to turn it from a String to an Integer
    # that way, we can compare it to the secret number (which is an int)
    @chosen_number = params[:id].to_i

    @win = @chosen_number == @secret_number
  end
end
