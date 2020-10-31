class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :address, :phone_number
  has_many :reviews
  # has_many :carts
  has_many :orders, through: :carts

end
