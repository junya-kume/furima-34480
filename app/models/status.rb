class Status < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '新品' },
    { id: 3, name: '開封済み/未使用' },
    { id: 4, name: '使用済み' }
  ]
  include ActiveHash::Associations
  has_many :product
end