class Admin::LessonsController < ApplicationController
    before_action :authenticate_user!, :is_admin?

    def index
        @user = current_user
        @lessons = Lesson.all
    end


    
end