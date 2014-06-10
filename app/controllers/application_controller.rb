class ApplicationController < ActionController::Base
  helper_method :current_user
  before_filter :is_signed_in?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  private
  def current_user
    current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def is_signed_in?
    if !current_user
      redirect_to login_path 
    end
  end
end