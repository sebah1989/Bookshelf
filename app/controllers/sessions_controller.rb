class SessionsController < ApplicationController
  layout 'sign_in'
  skip_before_action :is_signed_in?, only: [:new, :create]
  
  def new
  end
  
  def create
    user = User.find_by(email: params['/sessions'][:email])
    if user && user.authenticate(params['/sessions'][:password])
      session[:user_id] = user.id
      flash[:notice] = "You have successfully logged in."
      redirect_to user
    else
      render :new
      flash.now[:error] = "Invalid email or password."
    end
  end

  def delete
    session[:user_id] = nil
    flash[:notice] = "You have successfully logged out."
    redirect_to root_path
  end
end