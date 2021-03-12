require 'rails_helper'

RSpec.describe PurchaseProduct, type: :model do
  before do
    user = FactoryBot.create(:user)
    product = FactoryBot.create(:product)
    @purchase = FactoryBot.build(:purchase_product, user_id: user.id, product_id: product.id)
    sleep 0.02
  end
  describe '正常' do
    context '購入可能' do
      it '正常な値だと購入可能' do
        expect(@purchase).to be_valid
      end
      it 'ビル名は空でも購入できる' do
        @purchase.building_number = ""
        expect(@purchase).to be_valid
      end
    end

    context '空の項目がある際は購入できない' do
      it '郵便番号が空だと購入できない' do
        @purchase.postal_code = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号は○○○-○○○○以外だと購入できない' do
        @purchase.postal_code = "8001234"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postal code ○○○-○○○○以外は登録できません")
      end
      it '都道府県の情報が1だと購入できない' do
        @purchase.shipping_area_id = 1
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Shipping area must be other than 1")
      end
      it '市町村が空だと購入できない' do
        @purchase.municipalities = ""
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Municipalities can't be blank")
      end
      it '番地が空だと購入できない' do
        @purchase.address = ""
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと購入できない' do
        @purchase.phone_number = ""
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が数字11ケタ以内ではないと購入できない' do
        @purchase.phone_number = "123456789000"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it '電話番号が数字以外の文字が入ると購入できない' do
        @purchase.phone_number = "test"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number 数字11ケタ以内ではないと登録できません")
      end
      it 'トークンが空だと購入できない' do
        @purchase.token = ""
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idは空では登録できない' do
        @purchase.user_id = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idは空では登録できない' do
        @purchase.product_id = ""
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Product can't be blank")
      end
    end
  end
end
