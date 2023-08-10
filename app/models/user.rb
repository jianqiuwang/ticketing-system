class User < ApplicationRecord
    has_secure_password
    validates :password, presence: true
    validates :email, presence: true, uniqueness: true
    has_many :orders
end
