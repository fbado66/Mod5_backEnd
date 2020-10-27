class User < ApplicationRecord
    has_many :carts
    has_many :reviews
    has_secure_password

end
