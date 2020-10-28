class User < ApplicationRecord
    has_many :carts
    has_many :reviews
    has_many :orders, through: :carts
    has_secure_password

end
