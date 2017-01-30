class UsersController < ApplicationController
  def create
    User.create(user_params)
  end

  def index
    @emp_company_id =  current_user.company_id
    @company = Company.find(@emp_company_id)
    @company_vendors = @company.vendor_ids
  end

  private
  def user_params
    params.require(:user).permit(:name, :phone, :email, :role)
  end
end
