class Public::CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.find_all(params[:customer_id])
  end

  def create
    @cart_item = current_customer.cart_item.new(cart_item_params)
    if @cart_item.save
      redirect_to cart_items_path
    else
      @item = Item.find(params[:item_id])
      render item_path(@item)
    end
  end

  def update
  end

  def destroy
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end
