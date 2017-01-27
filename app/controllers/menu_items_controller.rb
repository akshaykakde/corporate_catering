class MenuItemsController < ApplicationController
  def new
  end

  def index
		@vendor = Vendor.find(params[:vendor_id])
		@menus=@vendor.menu_items	
  end
end
