class UsersController < ApplicationController
  def create
    c = Company.find_by(:_id => current_user.company_id)
  sdfgsdf
  gsdfgkjsdfgsdfjlgh
    c.users.create!(user_params)
  end

  def index
  end

  private

  def user_params
    params.require(:user).permit(:name, :phone_no, :email, :role)
  end
end
