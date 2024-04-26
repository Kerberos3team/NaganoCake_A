class Public::ItemsController < ApplicationController

  def index
    @items_all_counter = Item.all
    @items = Item.all.order(created_at: :desc).page(params[:page])
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end

end
