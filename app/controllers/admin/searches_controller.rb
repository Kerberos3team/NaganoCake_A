class Admin::SearchesController < ApplicationController
  before_action :authenticate_admin!

  def search
    @keyword = params[:keyword]
    @genre = params[:genre_id]
    @method = params[:type]
    if params[:type] === "items"
      @results = Item.search_for(@keyword, @method)
    elsif params[:type] === "genre"
      @results = Item.search_for(@genre, @method)
    else
      @results = Customer.search_for(@keyword)
    end
  end

end
