FactoryBot.define do
  factory :purchase_product do
    postal_code      {"111-1111"}
    phone_number     {"09012345678"}
    shipping_area_id {2}
    municipalities   {"test"}
    address          {"test"}
    building_number  {"test"}
    token            {"tok_00000000000000000000000000"}
    user_id          {}
    product_id       {}
  end
end
