class SessionsController < ApplicationController
  layout 'sign_in'
  skip_before_filter :is_signed_in?, only: [:new, :create]
  
  def new
  end
  
  def create
    user = User.find_by(email: params['/sessions'][:email])
    if user && user.authenticate(params['/sessions'][:password])
      session[:user_id] = user.id
      redirect_to user
    else
      render :new
    end
  end

  def delete
    session[:user_id] = nil
    redirect_to root_path
  end
end