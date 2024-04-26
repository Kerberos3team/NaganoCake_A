class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    if @order.update(order_params)
      @order_details.update_all(making_status: "waiting") if @order.status == "paid"
    end
    flash[:notice] = "注文ステータスを「" + @order.status_i18n + "」に更新しました。"
    redirect_to request.referer
  end

  def customer_order
    @customer = Customer.find(params[:customer_id])
    @orders = Order.where(customer_id: params[:customer_id]).page(params[:page]).order(created_at: :desc)
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end
end
