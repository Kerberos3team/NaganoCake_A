class Public::SearchesController < ApplicationController

  def search
    @keyword = params[:keyword]
    @genre = params[:genre_id]
    @type = params[:type]
    if params[:type] === "items_name"
      @results = Item.search_for(@keyword, @type)
    else
      @results = Item.search_for(@genre, @type)
    end
  end

end
