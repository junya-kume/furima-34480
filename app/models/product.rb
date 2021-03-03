class Product < ApplicationRecord
  belongs_to :user
  with_options presence: true do
    validates :name
    validates :descriotion
    validates :category_id
    validates :status_id
    validates :shopping_cost_id
    validates :shipping_area_id
    validates :shipping_day_id
    validates :price
  end
end
