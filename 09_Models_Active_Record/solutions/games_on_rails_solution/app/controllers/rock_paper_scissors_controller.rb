class RockPaperScissorsController < ApplicationController
  #NOTE: if you want to have this instance variable available to views (you do!)
  #attr_accessor is necessary, or else the attribute cannot be "read"
  attr_accessor :throws

  def initialize ()
    @throws = ['rock', 'paper', 'scissors']
  end
  
  def new
  end

  def show
    # use a random number to set a random throw for the Game
    @game_throw = @throws[rand(3)] #(remember rand(3) returns 0, 1 or 2)
    # use the params[:id] again to set the user's throw
    @user_throw = @throws[params[:id].to_i]
    # calculate the result of the game based on the throws
    @result = game_result(@game_throw, @user_throw)
  end

  private #this means the following methods are NOT actions. 
  #The user can't reach them with a url.

    #NOTE: there are many different ways to do this! if this one is confusing, don't worry
    #there are many right answers here
    def game_result(game_throw, user_throw)
      # create a hash which maps each throw (key)
      # to the throw that it beats (value)
      # e.g. beats["rock"] => "scissors" implies rock beats scissors
      beats = {
        "rock" => "scissors",
        "scissor" => "paper",
        "paper" => "rock"
      }

      # beats[@user_throw] is the throw the user can beat
      if beats[@user_throw] == @game_throw
        # if the game's throw is the one that the
        # user's throw beats, they win!
        @status = :win
      elsif user_throw == game_throw
        # if both throws are the same, it's a tie
        @status = :tie
      else
        # otherwise, the user loses
        @status = :loss
      end
    end
end
