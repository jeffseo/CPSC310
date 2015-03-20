class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @vendor = Vendor.find(params[:vendor_id])
    if @vendor
      @comment = @vendor.comments.build(comment_params)
      @comment.user = current_user
      if @comment.save
        flash[:success] = "Comment created!"
        redirect_to @vendor, :notice => "Thanks for the comment."
      else
        flash[:alert] = "There is an error in your comment."
        redirect_to @vendor, :alert => "Error!"
      end
    else
      redirect_to root_url, :alert => "You can't do that."
    end
  end

  def destroy
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :user_id)
    end
    
end
