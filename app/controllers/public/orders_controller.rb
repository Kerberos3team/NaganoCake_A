class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
    @order = Order.new
  end

  def confirm
  end

  def thanks
  end

  def index
  end

  def show
  end
end
