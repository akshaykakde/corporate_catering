class OrdersController < ApplicationController
  def index 
    @emp_company_id =  current_user.company_id
    @company = Company.find(@emp_company_id)
    @company_vendors = @company.vendor_ids
  end  
   
  def place_orders
    p params[:menu_selected]
     
    if @menu = MenuItem.find(params[:menu_selected])
      @order = Order.new
      @order.datetime = Time.now
      @order.save!
      @order.menu_items <<  @menu
      @order.users << User.find(current_user.id)
    end 
    @orders = Order.all
  end 

end
