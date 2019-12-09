class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @classrooms = Classroom.where(:student_id => current_user.id)
    @taught_lessons = Lesson.where(:teacher_id => current_user.id)
  end


  def new
    @user = User.new
  end


end
