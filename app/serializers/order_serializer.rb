class OrderSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :cart_id, :product_id     
end
