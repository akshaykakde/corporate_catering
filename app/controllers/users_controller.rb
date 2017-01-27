class UsersController < ApplicationController
  def create
    u =  User.create(user_params)
    puts u.as_json
    puts u.persisted?
  end

  def index
  
  end

  private

  def user_params
    params.require(:user).permit(:name, :phone, :email, :role)
  end
end
