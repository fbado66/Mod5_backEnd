class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :image_url, :restaurant_id, :option_id
end
