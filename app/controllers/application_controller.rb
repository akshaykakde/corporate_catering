class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  def after_sign_in_path_for(resource)
    if resource.role == 'hr'
      users_hr_dashboard_path
    else
      current_user_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:invite, keys: [:name, :phone, :email, :role])
  end

  private 

  def authenticate_inviter!
    current_user
  end
end
