class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :image_url
  has_one :restaurant
  has_one :option
end
