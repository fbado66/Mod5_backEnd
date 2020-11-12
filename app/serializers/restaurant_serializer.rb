class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :image_url, :address, :cuisines, :city, :zipcode, :latitude, :longitude, :price, :phone_number, :timings, :user_rating, :user_rating_text, :reviews_count
  has_many :products
  has_many :reviews
  
end
