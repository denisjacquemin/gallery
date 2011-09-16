class UsersController < ApplicationController
  
  layout 'login'
    
  def new
    @user = User.new

    unless params[:u].nil?
      @invitation = Invitation.find_by_hash(params[:u])
      @user.email = @invitation.email
    end
  end

  def create 
    @user = User.new(params[:user])
    
    # Security check
    # if it is an invitation (:hash is in the request), check if email and hash match in Invitation
    hack = false
    unless params[:hash].nil?
      if Invitation.where(:hash => params[:hash], :email => params[:user][:email]).empty?
        # hack detected, send back an error message
        hack = true
      end      
    end
    respond_to do |format|
      if hack
        format.html { render action: "new", notice: 'Hack detected' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      elsif @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else        
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
