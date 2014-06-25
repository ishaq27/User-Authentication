require 'test_helper'

class LoginsControllerTest < ActionController::TestCase
  test "should get signin" do
    get :signin
    assert_response :success
  end

  test "should get signup" do
    get :signup
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

end
