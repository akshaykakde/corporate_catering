class OrdersController < ApplicationController

  def place_orders
    p params[:menu_selected]
     
    if @menu = MenuItem.find(params[:menu_selected])
      @order = Order.new
      @order.datetime = Time.now
      @order.save!
      @order.menu_items <<  @menu
      p @order.menu_items
    end 
    @orders = Order.all
  end 

end
