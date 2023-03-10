class CreateBuyers < ActiveRecord::Migration[7.0]
  def change
    create_table :buyers do |t|
      t.integer :buy_id
      t.references :properties, null: false, foreign_key: true

      t.timestamps
    end
  end
end
