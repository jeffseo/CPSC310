require 'test_helper'

class VendorsControllerTest < ActionController::TestCase
  def setup
    @user = users(:michael)
    @other_user = users(:archer)
  end
  
  test "should get index" do
    get :index
    assert_redirected_to login_url
  end

  # test "the truth" do
  #   assert true
  # end
end
