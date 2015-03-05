class UsersController < ApplicationController
  # Created so that /users view can work
  def index
    @user = User.all
  end
  
  def show
    @user = User.find(params[:id])
    #debugger
  end
  
  def create
    render plain: params[:user].inspect
  end
  
  def new
    @user = User.new
  end
end
