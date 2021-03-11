class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  def index
    @product = Product.find(params[:product_id])
    find_purchase = Purchase.find_by user_product_id: @product.id
    @purchase_product = PurchaseProduct.new
    if find_purchase == nil
      if current_user.id == @product.user_id
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end 
  
  def create
    @product = Product.find(params[:product_id])
    @purchase_product = PurchaseProduct.new(purchase_product_params)
    if @purchase_product.valid?
      @purchase_product.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_product_params
    params.require(:purchase_product).permit(:postal_code, :phone_number, :shipping_area_id, :municipalities, :address, :building_number).merge(user_id: current_user.id, product_id: @product.id, token:params[:token], price: @product.price)
  end
end
