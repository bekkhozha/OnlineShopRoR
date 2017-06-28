class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def check_admin
    redirect_to root_url unless current_user && current_user.admin?
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys:[:name,:lastname,:phone,:gender,:age])
    devise_parameter_sanitizer.permit(:sign_up, keys:[:name,:lastname,:phone,:gender,:age])
  end
end
