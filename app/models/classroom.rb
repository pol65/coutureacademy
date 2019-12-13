class Classroom < ApplicationRecord
    belongs_to :student, class_name: "User"
    belongs_to :lesson
end
