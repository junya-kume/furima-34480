require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end
  describe '出品登録' do
    context '新規登録可能' do
      it '正常な値だと登録できる' do
        expect(@product).to be_valid
      end
    end
    
    context '空の項目がある際は出品できない' do
      it '商品画像を1枚つけることが必須であること' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が必須であること' do
        @product.name = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が必須であること' do
        @product.description = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーの情報が必須であること' do
        @product.category_id = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Category must be other than 1")
      end
      it '商品の状態についての情報が必須であること' do
        @product.status_id = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Status can't be blank")
        @product.status_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Status must be other than 1")
      end
      it '配送料の負担についての情報が必須であること' do
        @product.shopping_cost_id = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Shopping cost can't be blank")
        @product.shopping_cost_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Shopping cost must be other than 1")
      end
      it '発送元の地域についての情報が必須であること' do
        @product.shipping_area_id = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping area can't be blank")
        @product.shipping_area_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping area must be other than 1")
      end
      it '発送までの日数についての情報が必須であること' do
        @product.shipping_day_id = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping day can't be blank")
        @product.shipping_day_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping day must be other than 1")
      end
      it '販売価格についての情報が必須であること' do
        @product.price = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格は、¥300~¥9,999,999の間のみ保存可能であること' do
        @product.price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be greater than or equal to 300")
        @product.price = 10000000
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it '販売価格は半角数字のみ保存可能であること' do
        @product.price = "３００"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
