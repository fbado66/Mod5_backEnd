class CreateCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :carts do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.boolean :history, default: false 
      t.string :order_method

      t.timestamps
    end
  end
end
