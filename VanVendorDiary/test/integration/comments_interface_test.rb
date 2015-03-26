require 'test_helper'

class CommentsInterfaceTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @vendor = vendors(:tasty)
  end

  test "comment interface" do
    log_in_as(@user)
    get vendor_path(@vendor)
    assert_template 'vendors/show'
    assert_select 'div.pagination'
    # Invalid submission
    assert_no_difference 'Comment.count' do
      post vendor_comments_path(@vendor), comment: { content: "" }, vendor_id: @vendor.id
    end
    # TODO(sainan): figure out why the error explanation is not showing
    # assert_select 'div#error_explanation'
    # Valid submission
    content = "This comment really ties the room together"
    assert_difference 'Comment.count', 1 do
      post vendor_comments_path(@vendor), comment: { content: content }, vendor_id: @vendor.id
    end
    assert_redirected_to @vendor
    follow_redirect!
    assert_match content, response.body
    # Delete a post.
    assert_select 'a', text: 'delete'
    first_comment = @user.comments.paginate(page: 1).first
    assert_difference 'Comment.count', -1 do
      delete vendor_comment_path(@vendor, first_comment)
    end
    # Visit a different user.
    get user_path(users(:archer))
    assert_select 'a', text: 'delete', count: 0
  end
  
  test "micropost sidebar count" do
    log_in_as(@user)
    get vendor_path(@vendor)
    assert_match "#{@user.comments.count} comments", response.body
    # User with zero microposts
    other_user = users(:mallory)
    log_in_as(other_user)
    get vendor_path(@vendor)
    assert_match "0 comments", response.body
    @vendor.comments.create!(content: "A comment", user: @user)
    get vendor_path(@vendor)
    assert_match "#{other_user.comments.count} comments", response.body
  end
end
