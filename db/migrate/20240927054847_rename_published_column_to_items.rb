class RenamePublishedColumnToItems < ActiveRecord::Migration[7.2]
  def change
    rename_column :items, :published, :display
  end
end
