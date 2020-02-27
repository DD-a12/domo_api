class User < ApplicationRecord
    has_many :albums
    has_one_attached :avatar
    has_secure_password

    validates :email, presence: true, uniqueness: true,
    format: /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i    

    def full_name
        "#{first_name} #{last_name}"
    end
end

