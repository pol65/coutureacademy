class Lesson < ApplicationRecord
    has_many   :classrooms
    has_many   :students, class_name: "User" , through: :classrooms
    
    belongs_to :teacher, class_name: "User"

end
