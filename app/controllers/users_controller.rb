class UsersController < ApplicationController
  def create
    User.create(user_params)
  end

  private

    def user_params
      params.require(:user).permit(:name, :phone, :email, :role)
    end

end
