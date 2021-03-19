class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :product_find, only: [:index, :create]
  def index
    # カード情報を読み込む
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 環境変数を読み込む
    card = Card.find_by(user_id: current_user.id) # ユーザーのid情報を元に、カード情報を取得

    redirect_to new_card_path and return unless card.present?

    customer = Payjp::Customer.retrieve(card.customer_token) # 先程のカード情報を元に、顧客情報を取得
    @card = customer.cards.first

    @purchase_product = PurchaseProduct.new

    # 出品者がログインしているユーザーではないか確認
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
      @purchase_product.save
      pay_item
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_product_params
    params.require(:purchase_product).permit(:postal_code, :phone_number, :shipping_area_id, :municipalities, :address, :building_number).merge(user_id: current_user.id, product_id: @product.id)
  end

  def product_find
    @product = Product.find(params[:product_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 環境変数を読み込む
    customer_token = current_user.card.customer_token # ログインしているユーザーの顧客トークンを定義
    Payjp::Charge.create(
      amount: @product.price,
      customer: customer_token, 
      currency: 'jpy'
    )
  end
end
