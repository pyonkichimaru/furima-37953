class ProductsController < ApplicationController

  def index
    @products=Product.all
  end

  def new
    @products=Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to new_product_path
    else
      render 'new'
    end
  end




  private

  def product_params
    params.require(:product).permit(:name, :prefecture_id)
  end


end
