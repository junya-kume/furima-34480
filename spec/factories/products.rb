FactoryBot.define do
  factory :product do
    name             {'test'}
    description      {'test'}
    category_id      {2}
    status_id        {2}
    shopping_cost_id {2}
    shipping_area_id {2}
    shipping_day_id  {2}
    price            {500}
    association :user 
    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'),filename: 'test_image.png')
    end
  end
end
