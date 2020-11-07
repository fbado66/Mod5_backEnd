class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :image_url
      t.string :address
      t.string :city
      t.integer :zipcode
      t.integer :code
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
