require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  def setup
    @comment = comments(:orange)
    @user = users(:michael)
    @vendor = vendors(:tasty)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Comment.count' do
      post :create, comment: { content: "Lorem ipsum" }, user_id: @user.id, vendor_id: @vendor.id  
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Comment.count' do
      delete :destroy, id: @comment, vendor_id: @vendor.id
    end
    assert_redirected_to login_url
  end
  
  test "should redirect destroy for wrong comment" do
    log_in_as(users(:michael))
    comment = comments(:ants)
    vendor_id = comment.vendor_id
    assert_no_difference 'Comment.count' do
      delete :destroy, id: comment, vendor_id: vendor_id
    end
    assert_redirected_to root_url
  end

end
