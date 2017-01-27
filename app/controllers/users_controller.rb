class UsersController < ApplicationController
  def create
    User.create(user_params)
  end

  def index
  
  end

  private

  def user_params
    params.require(:user).permit(:name, :phone, :email, :role)
  end
end
