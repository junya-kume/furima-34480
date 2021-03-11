class PurchaseProduct
  include ActiveModel::Model
  attr_accessor :postal_code, :phone_number, :shipping_area_id, :municipalities, :address, :building_number, :user_id, :product_id

  PHONE_REGEX = /\A\d{11}+\z/.freeze
  POTAL_REGEX = /\A\d{3}[-]\d{4}\z/.freeze
  with_options presence: true do
    validates :municipalities
    validates :address
    validates :user_id
    validates :product_id

    validates :shipping_area_id, numericality: {other_than: 1}
    validates :phone_number, format:{ with: PHONE_REGEX, message: '数字11ケタ以外は登録できません'}
    validates :postal_code, format:{ with: POTAL_REGEX, message: '○○○-○○○○以外は登録できません'}
  end

  def save
    user_product = UserProduct.create(user_id: user_id, product_id: product_id)
    Purchase.create(postal_code: postal_code, phone_number: phone_number, shipping_area_id: shipping_area_id, municipalities: municipalities, address: address, building_number: building_number, user_product_id:user_product.id)
  end
end