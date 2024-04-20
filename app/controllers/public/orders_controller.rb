class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  before_action :no_cart_item, only:[:confirm]
  before_action :no_address_paymethod, only: [:confirm]

  def new
    @order = Order.new
    @address = Address.where(customer_id: current_customer.id)
  end

  def confirm
    @total_price = 0
    @shipping_cost = SHIPPING_COST
    @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.full_name
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:select_address] == "2"
      if params[:order][:postal_code].blank? || params[:order][:address].blank? || params[:order][:name].blank?
        render :new
      end
      @order.customer_id = current_customer.id
    else
      render :new
    end
      @cart_items = current_customer.cart_items
      @order_new = Order.new
  end

  def create
    order = Order.new(order_params)
    order.save
    @cart_items = current_customer.cart_items.all

    @cart_items.each do |cart_item|
      @order_details = OrderDetail.new
      @order_details.order_id = order.id
      @order_details.item_id = cart_item.item.id
      @order_details.price = cart_item.item.price
      @order_details.amount = cart_item.amount
      @order_details.making_status = 0
      @order_details.save!
    end
    CartItem.destroy_all
    redirect_to orders_thanks_path
  end

  def thanks
  end

  def index
    @order = current_customer
    @orders = @order.orders.page(params[:page]).order(created_at: "DESC")
  end

  def show
    @order_details = OrderDetail.where(order_id: params[:id])
    @order = Order.find(params[:id])
  end

  private

  def no_address_paymethod
    if params[:order][:payment_method].blank? || params[:order][:select_address].blank?
      redirect_to new_order_path
      flash[:notice] = "※支払方法とお届け先を指定してください"
    end
  end

  def no_cart_item
    cart_items = current_customer.cart_items
    redirect_to items_path if cart_items.none?
  end

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :customer_id, :shipping_cost, :total_payment, :status)
  end
end
