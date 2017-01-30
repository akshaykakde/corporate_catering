class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  def after_sign_in_path_for(resource)
    if resource.role == 'hr'
      users_hr_dashboard_path
    elsif resource.active == true && resource.role == 'employee'
      # enter ordering page here
    else
      current_user_path
      p "Give error msg that you are not an active member of this company"
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:invite, keys: [:name, :phone_no, :email, :role, :company_id])
  end

  private 

  def authenticate_inviter!
    current_user
  end
end
