class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.integer :postal_code     , null: false
      t.integer :phone_number    , null: false
      t.integer :shipping_area_id, null: false
      t.string  :municipalities  , null: false
      t.string  :address         , null: false
      t.string  :building_number , null: false
      t.references :user_product  , foregin_key: true
      t.timestamps
    end
  end
end
