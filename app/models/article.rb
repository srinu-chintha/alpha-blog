class Article<ApplicationRecord
    belongs_to :user
    validates :title ,presence: true,length: {minimum: 3,maximum: 4000}
    validates :description,presence: true,length: {minimum: 3,maximum: 4000}
end