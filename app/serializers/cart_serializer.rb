class CartSerializer < ActiveModel::Serializer
  attributes :id, :history, :order_method
  has_many :orders

end
