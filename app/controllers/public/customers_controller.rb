class Public::CustomersController < ApplicationController
  before_action :authenticate_customers!
  def show
  end

  def edit
  end

  def unsubscribe
  end

  def withdraw
  end
end
