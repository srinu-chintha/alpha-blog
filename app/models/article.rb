class Article<ApplicationRecord
    validates :title ,presence: true,length: {minimum: 3,maximum: 400}
    validates :description,presence: true,length: {minimum: 3,maximum: 400}
end