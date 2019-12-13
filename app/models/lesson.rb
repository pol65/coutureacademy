class Lesson < ApplicationRecord

    has_many   :classrooms, dependent: :destroy
    has_many   :students, class_name: "User", through: :classrooms
    
    belongs_to :teacher, class_name: "User"

    has_many :comments

    validates :title, presence: {message: "Le titre est nécessaire à la création d'un cours"}
    validates :title, uniqueness: {message: "Ce titre est déja pris, soyez unique"}
    validates :title , length: { in: 6..50 ,message: "Le titre doit contenir entre 6 et 50 caractères"}
    validates :content, presence: {message: "Un contenu est nécessaire à la création d'un cours"}
    validates :content, length: {minimum: 50 ,message: "Le contenu doit contenir au minimum 50 caractères"}
    validates :category, presence: true
end
