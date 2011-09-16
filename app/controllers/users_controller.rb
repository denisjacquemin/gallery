class UsersController < ApplicationController
  
  layout 'login'
    
  def new
    @user = User.new
  end

  def create 
      @user = User.find_by_hash(params[:u])
      if @user.update_attributes(params[:user])
        redirect_to root_url, :notice => 'Signed up!'
      else
        render 'new'
      end
  end  
end
