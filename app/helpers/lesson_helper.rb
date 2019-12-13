module LessonHelper
  def is_student_to_current_lesson(lesson)
    lesson.students.include?(current_user)
  end
end
