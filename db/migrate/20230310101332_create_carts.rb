class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.integer :user_id,  foreign_key: true
      t.references :property
      t.timestamps
    end
  end
end
