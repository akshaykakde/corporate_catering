class UsersController < ApplicationController
  def create
    User.create(user_params)
  end

  def index
    @emp_company_id =  User.first.company_id
    @company = Company.find(@emp_company_id)
    @company_vendors = @company.vendor_ids

    # @company_vendors.each do |v|
    #   @vendor = Vendor.find(v)
    #   @vendor_menus = @vendor.menu_items
    # end
  end

  private
  def user_params
    params.require(:user).permit(:name, :phone, :email, :role)
  end
end
