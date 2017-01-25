class VendorsController < ApplicationController
	def show
	end	

	def index
	 @vendors = Vendor.all
	end

  def select_vendors
    #puts params
    @company_temp=Company.last
    #p "=========================="
    p params[:vendor][:vendors_selected]
    if @company_temp.vendors << Vendor.find(params[:vendor][:vendors_selected])
      #redirect to HR Dashboard
    else
      render vendors_path  
    end  
  end 

end