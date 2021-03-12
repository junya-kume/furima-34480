class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :product_find, only: [:index, :create]
  def index
    @purchase_product = PurchaseProduct.new
    if product_find.user_product == nil
      if current_user.id == @product.user_id
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end 
  
  def create
    @purchase_product = PurchaseProduct.new(purchase_product_params)
    if @purchase_product.valid?
      pay_item
      @purchase_product.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_product_params
    params.require(:purchase_product).permit(:postal_code, :phone_number, :shipping_area_id, :municipalities, :address, :building_number).merge(user_id: current_user.id, product_id: @product.id, token:params[:token])
  end

  def product_find
    @product = Product.find(params[:product_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.price,
      card: purchase_product_params[:token],
      currency: 'jpy'
    )
  end
end
