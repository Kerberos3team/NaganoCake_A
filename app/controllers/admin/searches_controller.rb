class Admin::SearchesController < ApplicationController
  before_action :authenticate_admin!

  def search
    @keyword = params[:keyword]
    @type = params[:search_obj]
    if @type == "items"
      @results = Item.search_for(@keyword).page(params[:page])
    else
      @results = Customer.search_for(@keyword).page(params[:page])
    end
  end

end
