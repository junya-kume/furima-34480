class PurchaseProduct
  include ActiveModel::Model
  attr_accessor :postal_code, :phone_number, :shipping_area_id, :municipalities, :address, :building_number, :user_id, :product_id, :price, :token

  PHONE_REGEX = /\A\d{11}+\z/.freeze
  POTAL_REGEX = /\A\d{3}[-]\d{4}\z/.freeze
  with_options presence: true do
    validates :user_id
    validates :product_id

    validates :postal_code, format:{ with: POTAL_REGEX, message: '○○○-○○○○以外は登録できません'}
    validates :phone_number, format:{ with: PHONE_REGEX, message: '数字11ケタ以外は登録できません'}
    validates :shipping_area_id, numericality: {other_than: 1}
    validates :municipalities
    validates :address
  end

  def save
    user_product = UserProduct.create(user_id: user_id, product_id: product_id)
    purchase = Purchase.create!(postal_code: postal_code, phone_number: phone_number, shipping_area_id: shipping_area_id, municipalities: municipalities, address: address, building_number: building_number, user_product_id: user_product.id)
    pay_item
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: price,  # 商品の値段
      card: token,    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end