class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_product, only: [:index, :create]
  #before_action :move_to_index, only: [:create]

  def index
    @buy_address = BuyAddress.new
    if current_user == @product.user
       redirect_to root_path
    end   
  end

  def create
    @buy_address = BuyAddress.new(buy_params)
    if @buy_address.valid?
      @buy_address.save
      redirect_to root_path
    else
      render :index
    end
  end



  private

  def buy_params
    params.require(:buy_address).permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number).merge(user_id: current_user.id, product_id: params[:product_id])
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def move_to_index
    redirect_to root_path unless current_user == @product.user 
  end
end