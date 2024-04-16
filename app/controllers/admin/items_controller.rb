class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to item_path(@item), notice: "商品を登録しました。"
    else
      @item = Item.new
      render "new"
    end
  end

  def index
    @items = Item.all
  end

  def show
  end

  def edit
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :price, :status)
  end


end
