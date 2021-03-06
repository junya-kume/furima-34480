class CreateUserProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :user_products do |t|
      t.references :user   , null:false, foregin_key: true
      t.references :product, null:false, foregin_key: true
      t.timestamps
    end
  end
end