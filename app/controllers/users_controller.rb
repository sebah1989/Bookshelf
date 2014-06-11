class UsersController < ApplicationController
  skip_before_action :is_signed_in?, only: [:new, :create]
  expose(:user, attributes: :user_params)
  
  def new
  end
  
  def create
    if user.save
      flash[:notice] = "User has been created."
      redirect_to user
    else
      flash.now[:user] = "Can't create user."
      render :new
    end
  end

  def show
  end
  
  def edit
  end

  def update
    if user.update_attributes(user_params)
      flash[:notice] = "User has been updated."
      redirect_to root_path
    else 
      flash.now[:user] = "Can't update user."
      render :edit
    end
  end
  
  def delete
    user.delete
    flash[:notice] = "User has been deleted."
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end