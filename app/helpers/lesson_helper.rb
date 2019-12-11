module LessonHelper
    
    def is_student_to_current_lesson(lesson)
        lesson.students.include?(current_user)
    end

    def is_admin?
        if current_user.admin?
        else
            redirect_to root_path
            flash[:danger] = "Not an admin"
        end
    end
end
