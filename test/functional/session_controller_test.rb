require 'test_helper'

class SessionControllerTest < ActionController::TestCase
  test "should get login" do
    get :create
    assert_response :redirect
  end

  test "should get logout" do
    get :logout
    assert_response :redirect
  end

end
