class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items
    @total_price = 0
  end

# ↓ ifが重なっちゃって汚くなってしまった！でもこれ以外のやり方が分かりません！！泣

  def create
    cart_item = CartItem.new(cart_item_params)
    cart_item.customer_id = current_customer.id
    if cart_item.amount == nil
      @item = cart_item.item_id
      redirect_to item_path(@item)
    else
      if CartItem.find_by(item_id: params[:cart_item][:item_id], customer_id: current_customer.id).present?
        cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id], customer_id: current_customer.id)
        cart_item.amount += params[:cart_item][:amount].to_i
        cart_item.update(amount: cart_item.amount)
        redirect_to cart_items_path, notice: "カートに商品を追加しました。"
      else
        cart_item.save
        redirect_to cart_items_path, notice: "カートに商品を追加しました。"
      end
    end
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to request.referer, notice: "数量を変更しました。"
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to request.referer, notice: "カート内商品を削除しました。"
  end

  def destroy_all
    cart_items = current_customer.cart_items
    cart_items.destroy_all
    redirect_to request.referer, notice: "カート内商品をすべて削除しました。"
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount, :customer_id)
  end

end
