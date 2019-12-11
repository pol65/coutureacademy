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
<<<<<<< HEAD
=======

  def new
    @user = User.new
  end


>>>>>>> 0e90a402d810442d0647ab34b82f57d12a3f7c2f
end
