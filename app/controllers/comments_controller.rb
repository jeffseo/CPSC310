class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def create
    @vendor = Vendor.find(params[:vendor_id])
    if @vendor
      @comment = @vendor.comments.build(comment_params)
      @comment.user = current_user
      if @comment.save
        flash[:success] = "Comment created!"
      end
      redirect_to @vendor
    else
      redirect_to root_url, :alert => "You can't do that."
    end
  end

  def destroy
    @comment.destroy
    flash[:success] = "Comment deleted"
    redirect_to request.referrer || root_url
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :user_id)
    end
    
    def correct_user
     @comment = current_user.comments.find_by(id: params[:id])
     redirect_to root_url if @comment.nil?
    end
end
