class User<ApplicationRecord
    has_many :articles ,dependent: :destroy 
    before_save {self.email=email.downcase}
    VALID_EMAIL=/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :username,presence: true, length: {minimum: 2,maximum: 250},
            uniqueness: {case_sensitive: false}
    validates :email,presence: true,length: {maximum: 250},
            uniqueness: {case_sensitive: false},format: {with: VALID_EMAIL}

    has_secure_password
end