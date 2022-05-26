class ProductsController < ApplicationController
  before_action :authenticate_user!, only:[:new]  
  before_action :set_product, only: [:edit, :show]



  def index
    @products=Product.order(created_at: :desc)
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

  def show 
    @users = User.all
  end

  def edit

  end



  private

  def product_params
    params.require(:product).permit(:image, :product_name, :explanation, :price, :category_id, :product_condition_id, :delivery_charge_id, :area_id, :send_day_id).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end


end
