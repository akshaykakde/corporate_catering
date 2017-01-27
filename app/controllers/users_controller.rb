class UsersController < ApplicationController
  def index
    @emp_company_id =  User.first.company_id
    @company = Company.find(@emp_company_id)
    @company_vendors = @company.vendor_ids

    # @company_vendors.each do |v|
    #   @vendor = Vendor.find(v)
    #   @vendor_menus = @vendor.menu_items
    # end
      
  end
end
