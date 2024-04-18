class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
    @order = Order.new
  end

  def confirm
  @order = Order.new(order_params)
  @order.postal_code = current_customer.postal_code
  @order.address = current_customer.address
  @order.name = current_customer.first_name + current_customer.last_name
  end

  def create
    @order = Order.new(order_params)
  end

  def thanks
  end

  def index
  end

  def show
  end

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end
end
