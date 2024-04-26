class Public::SearchesController < ApplicationController


  def genre_search
    @genre = Genre.find(params[:genre_id])
    @genre_id = params[:genre_id]
    @items = Item.where(genre_id: @genre_id).page(params[:page])
    @genres = Genre.all
  end

  def search
    @genres = Genre.all
    @keyword = params[:keyword]
    @results_all = Item.search_for(@keyword)
    @results = @results_all.page(params[:page])
  end

end
