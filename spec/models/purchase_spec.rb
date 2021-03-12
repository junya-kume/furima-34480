require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    @purchase = FactoryBot.build(:purchase)
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
        binding.pry
        expect(@purchase.errors.full_messages).to include("")
      end
      it '都道府県の情報が1だと購入できない' do
        @purchase.shipping_area_id = 1
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("")
      end
      it '市町村が空だと購入できない' do
        @purchase.municipalities = ""
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("")
      end
      it '番地が空だと購入できない' do
        @purchase.address = ""
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("")
      end
      it '電話番号が空だと購入できない' do
        @purchase.phone_number = ""
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("")
      end
    end
  end
end
