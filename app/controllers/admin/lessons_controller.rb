class Admin::LessonsController < ApplicationController
    before_action :authenticate_user!, :is_admin?

    def index
        @users = User.all
        @lessons = Lesson.all
    end

    def update 
        @lesson = Lesson.find(params[:id])
        if @lesson.update(checked: true)
            flash[:success] = "Le cours a bien été validé !"
            redirect_to admin_lessons_path
        else 
            flash[:warning] = "Le cours n'a pas été validé !"
            redirect_to admin_lessons_path
        end
    end
end
    


    
