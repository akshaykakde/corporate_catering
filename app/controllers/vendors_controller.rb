class VendorsController < ApplicationController
	def show

	end	

	def index
	 @vendors = Vendor.all
	end

  def select_vendors
    #puts params
    @company=Company.find(current_user.company_id)
    p "-=============="
    p @company
    p params[:vendor][:vendors_selected]
    if @company.vendors << Vendor.find(params[:vendor][:vendors_selected])
      # redirect to 
    else
      render vendors_path  
    end  
  end 

end