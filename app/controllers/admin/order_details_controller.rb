class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details.all

    is_updated = true
    if @order_detail.update(order_detail_params)
      @order.update(status: "producting") if @order_detail.making_status == "producting"
      @order_details.each do |order_detail|
        if order_detail.making_status != "completion"
          is_updated = false
        end
      end
        @order.update(status: "preparing") if is_updated
    end
    flash[:notice] = "製作ステータスを「" + @order_detail.making_status_i18n + "」に更新しました。"
    redirect_to request.referer
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
