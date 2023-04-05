class Public::OrdersController < ApplicationController
  #https://qiita.com/HAMO-ss/items/13665dd0370a22b8e166 を参照にする
  def new
   @order = Order.new
   @customer = current_customer
  end



  def show
  end

  def index
  end

  def confirm
   @order = Order.new(order_params)
   @order.postal_code = current_customer.postal_code
   @order.address = current_customer.address
   @order.name = current_customer.first_name + current_customer.last_name
  end

  def complete
  end

 private


  def order_params
   #params.require(:order).permit(:payment_method, :postal_code, :address, :name)
   
  end
   
end
