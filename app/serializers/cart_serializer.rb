class CartSerializer < ActiveModel::Serializer
  attributes :id, :history, :type
  has_one :user
end
