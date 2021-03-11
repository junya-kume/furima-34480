class Purchase < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  
  belongs_to :user_product, optional: true

  #attr_accessor :token
  #validates :token, presence: true
end
