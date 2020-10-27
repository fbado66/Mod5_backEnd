class Product < ApplicationRecord
  belongs_to :restaurant
  belongs_to :option
  has_many :orders
end
