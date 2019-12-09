class Lesson < ApplicationRecord

    has_many   :classrooms
    has_many   :students, class_name: "User" , through: :classrooms
    
    belongs_to :teacher, class_name: "User"




    def teacher_destroy
        if current_user.id = teacher.id
        else
        end
    end
end
