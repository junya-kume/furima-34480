class PurchaseProduct
  include ActiveModel::Model
  attr_accessor :postal_code, :phone_number, :shipping_area_id, :municipalities, :address, :building_number, :user_id, :product_id, :token

  PHONE_REGEX = /\A[0-9]+\z/.freeze
  POTAL_REGEX = /\A\d{3}[-]\d{4}\z/.freeze
  with_options presence: true do
    validates :user_id
    validates :product_id
    validates :token
    validates :postal_code, format:{ with: POTAL_REGEX, message: 'は○○○-○○○○以外は登録できません'}
    validates :phone_number, length:{maximum: 11},format:{ with: PHONE_REGEX, message: 'は数字11ケタ以内ではないと登録できません'}
    validates :shipping_area_id, numericality: {other_than: 1, message: 'を変更してくだい' }
    validates :municipalities
    validates :address
  end

  def save
    user_product = UserProduct.create(user_id: user_id, product_id: product_id)
    purchase = Purchase.create!(postal_code: postal_code, phone_number: phone_number, shipping_area_id: shipping_area_id, municipalities: municipalities, address: address, building_number: building_number, user_product_id: user_product.id)
  end
end