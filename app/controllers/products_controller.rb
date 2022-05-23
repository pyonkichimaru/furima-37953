class ProductsController < ApplicationController
  before_action :authenticate_user!   #ログインしていないユーザーをログインページの画面に促す



  def index
    @products=Product.all
  end

  def new
    @product=Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render 'new'
    end
  end




  private

  def product_params
    params.require(:product).permit(:image, :product_name, :explanation, :price, :category_id, :product_condition_id, :delivery_charge_id, :area_id, :send_day_id)
  end


end
