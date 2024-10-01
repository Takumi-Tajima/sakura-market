class AddPositionToItems < ActiveRecord::Migration[7.2]
  def change
    add_column :items, :position, :integer
  end
end
