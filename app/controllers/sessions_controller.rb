class SessionsController < ApplicationController
  def new
  end

  #omniauth
  def create2
    auth = request.env["omniauth.auth"]
    omniauthuser = Omniauthuser.find_by_provider_and_uid(auth["provider"], auth["uid"]) #|| Omniauthuser.create_with_omniauth(auth)
    omniauthuser = Omniauthuser.omniauth(env['omniauth.auth'])
    session[:user_id] = omniauthuser.id
    log_in omniauthuser
    redirect_to root_url, :notice=> "Signed in! Hello " + omniauthuser.name + "!"
  end

  def failure  
    redirect_to root_url, alert: "Authentication failed, please try again."  
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
    session[:user_id] = nil
    log_out
    redirect_to root_url
  end
end