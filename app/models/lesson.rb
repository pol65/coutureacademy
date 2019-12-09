class Lesson < ApplicationRecord

    has_many   :classrooms
    has_many   :students, class_name: "User" , through: :classrooms
    
    belongs_to :teacher, class_name: "User"


    validates :title, :content, :category, presence: true 
    validates :title, uniqueness: true 
    validates :title , length: { in: 6..20 }
    validates :content, length: {minimum: 50 }
    validates :price, :numericality => { :greater_than_or_equal_to => 0.0 }

end
