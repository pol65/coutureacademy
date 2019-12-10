module LessonHelper
    def initialize
        @student = current_user
    end
    def is_student_to_current_lesson(lesson)
        lesson.students.include?(@student)
        
    end
end
