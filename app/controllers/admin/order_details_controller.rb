class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    if @order_detail.update(order_detail_params)
      @order.update(status: "producting") if @order_detail.making_status == "producting"
      @order.update(status: "preparing") if @order_detail.making_status == "completion"
    end
    flash[:notice] = "製作ステータスを「" + @order_detail.making_status_i18n + "」に更新しました。"
    redirect_to request.referer
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
