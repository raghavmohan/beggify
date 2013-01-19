require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get performer" do
    get :performer
    assert_response :success
  end

end
