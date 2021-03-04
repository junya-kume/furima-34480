class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :cost
  belongs_to :area
  belongs_to :day
  
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :description
    validates :image
    with_options numericality: {other_than: 1} do
      validates :category_id
      validates :status_id
      validates :shopping_cost_id
      validates :shipping_area_id
      validates :shipping_day_id
    end
    with_options numericality: {:greater_than_or_equal_to => 300 } do
      with_options numericality: {:less_than_or_equal_to => 9999999 } do
        validates :price
      end
    end
  end
end
