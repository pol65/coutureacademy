class ClassroomsController < ApplicationController
    before_action :authenticate_user!, only: [:create]
def index
    
end

def create
    @classroom = Classroom.new(
        lesson_id: params[:lesson_id], 
        student_id: current_user.id )
        
    if @classroom.save 
        flash[:success] = "Vous vous êtes bien inscrit!"
        redirect_to root_path
    else
        redirect_to new_lesson_path
    end
end

def destroy 
    @classroom = Classroom.find(params[:id])
    @classroom.destroy
    if @classroom.destroy 
      flash[:warning] = "Vous n'êtes plus inscrit à ce cours !"
      redirect_to root_path
    else
      render "new"
    end
end


end







