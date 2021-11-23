class User<ApplicationRecord
    has_many :articles  
    VALID_EMAIL=/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :username,presence: true, length: {minimum: 2,maximum: 25},
            uniqueness: {case_sensitive: false}
    validates :email,presence: true,length: {maximum: 25},
            uniqueness: {case_sensitive: false},format: {with: VALID_EMAIL}
end