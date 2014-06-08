class UsersController < ApplicationController
  skip_before_filter :is_signed_in?, only: [:new, :create]
  expose(:user, attributes: :user_params)
  
  def new
  end
  
  def create
    if user.save
      redirect_to user
    else
      render :new
    end
  end

  def show
  end
  
  def edit
  end

  def update
    if user.update_attributes(user_params)
      redirect_to root_path
    else 
      render :edit
    end
  end
  
  def delete
    user.delete
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end