require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  def setup
    @base_title = "Vancouver Vendor Diary"
  end
  
  test "should get index" do
    get :index
    assert_response :success
    assert_select "title", "Welcome | #{@base_title}"
  end

end
