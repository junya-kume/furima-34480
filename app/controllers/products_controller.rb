class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @products = Product.all
    @user_products = UserProduct.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :category_id, :status_id, :shopping_cost_id, :shipping_area_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
