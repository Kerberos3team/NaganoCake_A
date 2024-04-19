class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
  end

  def index
    @orders = Order.all
  end

  def customer_order
    @orders = Order.where(customer_id: params[:id])
  end
end
