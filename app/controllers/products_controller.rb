class ProductsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :edit, :destroy]  
  before_action :set_product, only: [:show, :edit, :destroy, :update]
  before_action :move_to_index, only: [:edit, :destroy]



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
    
  end

  def edit

  end

  def update
    if @product.update(product_params)
       redirect_to product_path
    else
      render 'edit'
    end
  end
 
  def destroy
    if @product.destroy
       redirect_to root_path
    else
      render 'show'
    end
  end



  private

  def product_params
    params.require(:product).permit(:image, :product_name, :explanation, :price, :category_id, :product_condition_id, :delivery_charge_id, :area_id, :send_day_id).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def move_to_index
    redirect_to root_path unless current_user == @product.user 
  end  


end
