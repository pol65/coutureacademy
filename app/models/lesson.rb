class Lesson < ApplicationRecord

    has_many   :classrooms, dependent: :destroy
    has_many   :students, class_name: "User" , through: :classrooms
    
    belongs_to :teacher, class_name: "User"

<<<<<<< HEAD
=======
    has_many :comments
>>>>>>> development

    validates :title, :content, :category,   presence: true 
    validates :title, uniqueness: true 
    validates :title , length: { in: 6..50 }
   # validates :summary; legnht: { in: 150..250}
    validates :content, length: {minimum: 50 }
   # validates :price, :numericality => { :greater_than_or_equal_to => 0.0 }

end
