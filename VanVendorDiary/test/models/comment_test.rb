require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    # This code is not idiomatically correct.
    @comment = @user.comments.build(content: "Lorem ipsum")
  end

  test "should be valid" do
    assert @comment.valid?
  end

  test "user id should be present" do
    @comment.user_id = nil
    assert_not @comment.valid?
  end
  
  test "content should be present " do
    @comment.content = "   "
    assert_not @comment.valid?
  end

  test "content should be at most 200 characters" do
    @comment.content = "a" * 201
    assert_not @comment.valid?
  end
end
