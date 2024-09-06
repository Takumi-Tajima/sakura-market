class CreateItems < ActiveRecord::Migration[7.2]
  def change
    create_table :items do |t|
      t.string :name, null: false, default: ''
      t.integer :price, null: false, default: ''
      t.text :description, null: false, default: ''
      t.boolean :hidden, null: false, default: false

      t.timestamps
    end
  end
end
