class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :image_url
  has_many :products
end
