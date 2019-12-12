class Lesson < ApplicationRecord

    has_many   :classrooms, dependent: :destroy
    has_many   :students, class_name: "User" , through: :classrooms
    
    belongs_to :teacher, class_name: "User"

    has_many :comments

    validates :title, presence: {message: "Le titre est nécessaire à la création d'un cours"}
    validates :content, presence: true 
    validates :category, presence: true 
    validates :title, uniqueness: true 
    validates :title , length: { in: 6..50 }
    validates :content, length: {minimum: 50 }

end
