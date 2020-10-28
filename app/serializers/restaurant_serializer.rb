class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :image_url, :address, :city, :zipcode
  has_many :products
end
