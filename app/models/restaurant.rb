class Restaurant < ApplicationRecord
    has_many :products
    has_many :reviews
end
