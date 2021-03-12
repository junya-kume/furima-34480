require 'rails_helper'

RSpec.describe PurchaseProduct, type: :model do
  before do
    @purchase = FactoryBot.build(:purchase_product)
  end
  describe '正常' do
    context '購入可能' do
      it '正常な値だと購入可能' do
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
      it '電話番号が数字11ケタ以外だと購入できない' do
        @purchase.phone_number = "1234567890"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number 数字11ケタ以外は登録できません")
      end
    end
  end
end
