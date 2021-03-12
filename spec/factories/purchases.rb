FactoryBot.define do
  factory :purchase do
    postal_code      {"111-1111"}
    phone_number     {"09012345678"}
    shipping_area_id {2}
    municipalities   {"test"}
    address          {"test"}
    building_number  {"test"}
    association :user_product
  end
end
