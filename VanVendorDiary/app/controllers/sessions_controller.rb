class SessionsController < ApplicationController
  def new
  end

  #omniauth
  def facebookcreate
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
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      if @user.activated?
        log_in @user
        params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
      else
        message  = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
      end
      redirect_to root_url
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    log_out if logged_in?
    redirect_to root_url
  end
end
