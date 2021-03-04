class Day < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '当日発送' },
    { id: 3, name: '2・3日後に発送' },
    { id: 4, name: '1週間以内に発送' },
    { id: 5, name: '1週間以降に発送' },
  ]
  include ActiveHash::Associations
  has_many :product
end