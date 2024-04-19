class Public::SearchesController < ApplicationController


  def genre_search
    @genre = Genre.find(params[:genre_id])
    @genre_id = params[:genre_id]
    @items = Item.where(genre_id: @genre_id)
    @genres = Genre.all
  end  

  def search
    @keyword = params[:keyword]
    @results = Item.search_for(@keyword)
  end

end
