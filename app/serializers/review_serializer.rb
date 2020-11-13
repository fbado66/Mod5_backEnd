class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :content, :rating, :restaurant_id, :user_id, :user_name
  
  
  
end
