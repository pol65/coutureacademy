class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @classrooms = Classroom.where(:student_id => @user.id)
    @taught_lessons = Lesson.where(:teacher_id => @user.id)
    end


    def destroy
      @user = User.find(params[:id])
      @user.destroy
      if @user.destroy 
        flash[:warning] = "Le compte a bien été supprimé !"
        redirect_to root_path
      else
        render "new"
      end
    end
end
