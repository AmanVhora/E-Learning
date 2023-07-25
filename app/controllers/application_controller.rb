class ApplicationController < ActionController::Base
  before_action :authenticate_teacher!, unless: :devise_or_active_admin_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name phone_no gender education birth_date profile_photo])
  end

  def devise_or_active_admin_controller?
    devise_controller? || is_a?(ActiveAdmin::BaseController)
  end
end
