require 'test_helper'

class VendorsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  # test "the truth" do
  #   assert true
  # end
end
