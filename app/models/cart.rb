class Cart < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_many :products, through: :orders

  # def total 
  #   self.products.sum(:price)
  # end 

end
