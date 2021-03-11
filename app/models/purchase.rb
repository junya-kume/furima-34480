class Purchase < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions  
  belongs_to :user_product, optional: true

end
