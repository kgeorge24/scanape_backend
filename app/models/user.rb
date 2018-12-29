class User < ApplicationRecord
    has_many :scans
    has_many :user_ingredients
    has_many :ingredients, through: :user_ingredients
    has_secure_password
    # attr password password_confirmation
    validates :username, uniqueness: { case_sensitive: false }
end
