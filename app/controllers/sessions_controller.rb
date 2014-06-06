class SessionsController < ApplicationController
  def new
    
  end
  
  def create
    user = User.find_by(email: params['/sessions'][:email])
    if user.authenticate(params['/sessions'][:password])
      session[:user_id] = user.id
      redirect_to user
    else
      render :new
    end
  end

  def delete
    session[:user_id] = nil
    redirect_to books_path
  end
end