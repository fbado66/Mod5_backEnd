class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :image_url
      t.string :address
      t.string :cuisines
      t.string :city
      t.integer :zipcode
      t.integer :code
      t.float :latitude
      t.float :longitude
      t.float :user_rating
      t.string :user_rating_text
      t.string :timings
      t.integer :price
      t.string :phone_number
      t.integer :reviews_count

      t.timestamps
    end
  end
end
