class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :card, dependent: :destroy
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  NAME_REGEX = /\A(?=.*?[ぁ-んァ-ヶ一-龥々])[ぁ-んァ-ヶ一-龥々]+\z/i.freeze
  FURIGANA_REGEX = /\A(?=.*?[ァ-ヶ一])[ァ-ヶ一]+\z/i.freeze
  with_options presence: true do
    validates :nickname
    validates :email
    validates :birthday
    with_options format:{ with: PASSWORD_REGEX, message: 'Include both letters and numbers'} do
      validates :password
    end
    with_options format:{ with: NAME_REGEX, message: '全角漢字・ひらがな・カタカナ以外は登録できません'} do
      validates :first_name
      validates :last_name
    end
    with_options format:{ with: FURIGANA_REGEX, message: 'カタカナ以外は登録できません'} do
      validates :first_furigana
      validates :last_furigana
    end
  end
  has_many :products
  has_many :user_products
end


