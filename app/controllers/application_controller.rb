class ApplicationController < ActionController::Base
  before_action :authenticate_teacher
  skip_before_action :authenticate_teacher, if: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name phone_no gender education birth_date profile_photo])
  end

  def authenticate_teacher
    redirect_to new_teacher_session_path, flash: { alert: "You must be signed in" } if !current_teacher.present?
  end
end
