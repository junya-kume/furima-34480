class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.string :postal_code      , null: false
      t.string :phone_number     , null: false
      t.integer :shipping_area_id, null: false
      t.string  :municipalities  , null: false
      t.string  :address         , null: false
      t.string  :building_number
      t.references :user_product  , foregin_key: true
      t.timestamps
    end
  end
end
