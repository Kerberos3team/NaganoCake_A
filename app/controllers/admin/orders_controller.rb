class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
  end
  
  def update
    
  end

  def index
    @orders = Order.all.order(created_at: "DESC")
  end

  def customer_order
    @customer = Customer.find(params[:customer_id])
    @orders = Order.where(customer_id: params[:customer_id])
  end
end
