class Public::CartItemsController < ApplicationController
  before_action :authenticate_customers!
  def index
  end
end
