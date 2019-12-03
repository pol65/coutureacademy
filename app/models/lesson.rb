class Lesson < ApplicationRecord

    has_many   :classrooms
    has_many   :users, through: :classrooms
    
    belongs_to :teacher, class_name: "User"
end
