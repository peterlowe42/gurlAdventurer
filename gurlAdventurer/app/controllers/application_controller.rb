class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include DeviseHelper
  
  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up [:username, :email, :password, :password_confirmation])
  	devise_parameter_sanitizer.permit(:sign_in [:email, :password, :password_confirmation])
  	devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password, :password_confirmation, :current_password])
  end
end
