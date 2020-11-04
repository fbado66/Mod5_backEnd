class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :image_url, :address, :city, :zipcode
  has_many :products
  has_many :reviews
  # has_many :options, through: :products
  # has_many :options
end
