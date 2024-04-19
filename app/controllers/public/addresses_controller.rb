class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @address = Address.new
    @addresses = current_customer.addresses
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to addresses_path, notice: "配送先登録しました。"
    else
      @addresses = current_customer.addresses
      flash.now[:alert] = "失敗しました。"
      render 'index'
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    address = Address.find(params[:id])
    if address.update(address_params)
      flash[:notice] = '配送先の更新に成功しました。'
      redirect_to addresses_path
    else
      render "edit"
    end
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:customer_id, :name, :postal_code, :address)
  end
end
