class Purchase < ApplicationRecord
  belongs_to :area
  
  belongs_to :user_product
  
  attr_accessor :token
  validates :token, presence: true
end
