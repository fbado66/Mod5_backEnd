class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :content, :rating, :restaurant_id, :user_id
  
  
end
