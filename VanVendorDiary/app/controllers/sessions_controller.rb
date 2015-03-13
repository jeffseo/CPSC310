class SessionsController < ApplicationController
  def new
  end

  #omniauth
  def create2
    omniauthuser = Omniauthuser.omniauth(env['omniauth.auth'])
    session[:user_id] = omniauthuser.id
    redirect_to root_url
  end

  def destroy2
    session[:user_id] = nil
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
    log_out
    redirect_to root_url
  end
end
