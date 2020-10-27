class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :content, :rating
  has_one :restaurant
  has_one :user
end
