class VendorsController < ApplicationController
	def show
	end	

	def index
	 @vendors=Vendor.all
	end	

end