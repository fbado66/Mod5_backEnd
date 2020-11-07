class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :image_url, :address, :cuisines, :city, :zipcode, :latitude, :longitude
  has_many :products
  has_many :reviews
  
end
