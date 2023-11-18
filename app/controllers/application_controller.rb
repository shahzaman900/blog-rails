class ApplicationController < ActionController::Base
  #before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :name, :password, :post_counter) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :name, :password, :current_password) }
  end

  def after_sign_in_path_for(resource)
    @user = User.where(email: resource.email).first
    session[:user] = @user
    root_path
  end
end

