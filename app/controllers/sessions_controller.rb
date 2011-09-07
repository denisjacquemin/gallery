class SessionsController < ApplicationController
  
  before_filter :login_required, :only => [:destroy]
  layout 'login'
  
  
  def new
  end
  
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to admin_root_url, :notice => "logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to admin_root_url, :notice => "logged out!"
  end

end
