class ApplicationController < ActionController::Base
  before_action :authenticate_teacher
  skip_before_action :authenticate_teacher, if: :devise_controller?

  private
  def authenticate_teacher
    redirect_to new_teacher_session_path, flash: { alert: "You must be signed in" } if !current_teacher.present?
  end
end
