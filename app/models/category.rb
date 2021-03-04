class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'レディース' },
    { id: 3, name: 'メンズ' },
    { id: 4, name: '美容' },
    { id: 5, name: 'キッズ' },
    { id: 6, name: 'ホビー' },
    { id: 7, name: '楽器' },
    { id: 8, name: 'チケット' },
    { id: 9, name: '日用品' },
    { id: 10, name: '家電' },
    { id: 11, name: 'ハンドメイド' },
    { id: 12, name: '食品' },
    { id: 13, name: 'スポーツ' },
    { id: 14, name: '自動車' },
    { id: 15, name: 'その他' }
  ]
  include ActiveHash::Associations
  has_many :products
end