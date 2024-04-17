class Public::CartItemsController < ApplicationController

  def index
    @cart_items = current_user.cart_items
  end

  def create
    @cart_item = current_customer.cart_item.new(cart_item_params)
    if @cart_item.save
      redirect_to cart_items_path
    else
      redirect_to items_path
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
