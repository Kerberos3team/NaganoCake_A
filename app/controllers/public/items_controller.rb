class Public::ItemsController < ApplicationController

  def index
    @items_all_counter = Item.all
    @items = Item.all.order(created_at: :desc).page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

end
