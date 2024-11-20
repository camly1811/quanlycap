class AddFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :gender, :integer, default: 0
    add_column :users, :phone, :string
    add_column :users, :address, :string
  end
end
