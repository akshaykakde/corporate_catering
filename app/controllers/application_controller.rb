
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_user, :logged_in?
  
  def after_sign_in_path_for(resource)
    if(current_user.role == "hr")
      users_hr_dashboard_path
    elsif resource.active == true && resource.role == 'employee'
      user_orders_path(current_user.id)
    else
      current_user_path
      p "Give error msg that you are not an active member of this company"
      root_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:invite, keys: [:name, :phone, :email, :role, :company_id])
  end

  # helper_method :current_user, :logged_in?

  # def current_user
  #   @current_user ||= User.find_by(session[:user])
  # end

  # def logged_in?
  #   current_user != nil
  # end

end
