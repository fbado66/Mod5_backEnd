class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.string :image_url
      t.string :category
      t.belongs_to :restaurant, null: false, foreign_key: true
      t.belongs_to :option, null: false, foreign_key: true

      t.timestamps
    end
  end
end
