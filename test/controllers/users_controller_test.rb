require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get signin" do
    get :signin
    assert_response :success
  end

  test "should get signout" do
    get :signout
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

end
