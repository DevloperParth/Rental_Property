class AddPartNumberToProperty < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :verfied, :boolean ,:default => false
  end
end
