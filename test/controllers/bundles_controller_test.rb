require 'test_helper'

class BundlesControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get make" do
    get :make
    assert_response :success
  end

end
