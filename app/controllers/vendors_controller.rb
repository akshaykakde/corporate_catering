class VendorsController < ApplicationController
	def show

	end	

	def index
	 @vendors = Vendor.all
	end

  def select_vendors
    #puts params
    @company=Company.find(current_user.company_id)
    if @company.vendors << Vendor.find(params[:vendor][:vendors_selected])
      #render "vendors/select_vendors"
      flash[:notice] = "Vendor Successfully added !" 
    else
      redirect_to vendors_path  
    end  
  end 

end