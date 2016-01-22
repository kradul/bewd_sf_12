require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get show_movies" do
    get :show_movies
    assert_response :success
  end

end
