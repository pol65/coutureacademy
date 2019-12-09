class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
<<<<<<< HEAD
=======
    @classrooms = Classroom.where(:student_id => current_user.id)
    @taught_lessons = Lesson.where(:teacher_id => current_user.id)
>>>>>>> 08aaaf3a298630ebe43ccc994aa8eefc58e483eb
  end
end
