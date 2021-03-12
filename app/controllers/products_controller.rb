class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :product_find, only:[:show, :edit, :update, :destroy]
  before_action :user_check, only:[:edit, :update, :destroy]
  def index
    @products = Product.all.order("created_at DESC")
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

  def show
    @user_product = UserProduct.find_by product_id:@product.id
    if product_find.user_product == nil
      @user_product = UserProduct.new
    end 
  end

  def edit
    find_purchase = UserProduct.find_by product_id: @product.id
    unless product_find.user_product == nil
      redirect_to root_path
    end
  end

  def update
    if @product.update(product_params)
      redirect_to product_path
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :category_id, :status_id, :shopping_cost_id, :shipping_area_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def product_find
    @product = Product.find(params[:id])
  end
  
  def user_check
    unless (current_user.id == @product.user_id)
      redirect_to action: :index
    end
  end
end
