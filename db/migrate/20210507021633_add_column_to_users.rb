class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :postal_code, :integer
    add_column :users, :prefecture_code, :integer
    add_column :users, :address_city, :string
    add_column :users, :address_street, :string
  end
end