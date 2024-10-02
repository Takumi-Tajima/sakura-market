class AddNameAndAddressToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :name, :string, null: false, default: ''
    add_column :users, :address, :string, null: false, default: ''
  end
end
