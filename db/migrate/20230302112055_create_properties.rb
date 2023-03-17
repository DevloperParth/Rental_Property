class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.text :description
      t.integer :price
      t.string :property_type
      t.string :location
      t.string :image
      t.string :city
      t.string :address
      t.integer :user_id, foreign_key: true
      t.timestamps
    end
  end
end
