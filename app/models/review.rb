class Review < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user

  def user_name 
    self.user.name
  end 

end
