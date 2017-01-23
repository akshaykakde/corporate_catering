class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path(resource)
    current_user_path
  end

  private
  
    def authenticate_inviter!
      current_user
    end
end
