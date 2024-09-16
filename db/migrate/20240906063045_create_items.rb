class CreateItems < ActiveRecord::Migration[7.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :price, null: false, default: 0
      t.text :description, null: false, default: ''
      t.boolean :published, null: false, default: false

      t.timestamps
    end
  end
end
