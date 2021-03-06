class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @products = Product.all.order("created_at DESC")
    #@user_products = UserProduct.all
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
    @products = Product.all
    @products.each do |pro|
      if params[:id].to_i == pro.id
        @product = Product.find(params[:id])
      end
    end
    if @product == nil
      redirect_to action: :index
    end
    @user_products = UserProduct.all
  end

  def edit
  #  if current_user == nil
  #    redirect_to action: :index
  #  else
  #    @products = Product.all
  #    @products.each do |pro|
  #      if params[:id].to_i == pro.id
  #        @product = Product.find(params[:id])
  #        unless (current_user.id == @product.user_id)
  #          redirect_to action: :index
  #        end
  #      else
  #        redirect_to action: :index
  #      end 
  #    end
  #  end
  end

  def update
  #  @product = Product.find(params[:id])
  #  if @product.update(product_params)
  #    redirect_to product_path
  #  else
  #    render :edit
  #  end
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :category_id, :status_id, :shopping_cost_id, :shipping_area_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
