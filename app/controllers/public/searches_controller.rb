class Public::SearchesController < ApplicationController

  def search
    @keyword = params[:keyword]
    @results = Item.search_for(@keyword)
  end

end
