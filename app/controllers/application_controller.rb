class ApplicationController < ActionController::Base
  helper_method :current_user
  before_filter :is_signed_in?

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