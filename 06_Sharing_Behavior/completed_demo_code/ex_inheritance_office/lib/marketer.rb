require_relative 'employee'

class Marketer < Employee
  attr_accessor :twitter_handle

  def initialize(first_name, last_name, twitter_handle)
    super(first_name, last_name)
    @twitter_handle = twitter_handle
  end

  def contact
    @twitter_handle
  end
end