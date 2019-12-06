class Admin::LessonsController < ApplicationController
    before_action :authenticate_user!, :is_admin?

    def index
        @users = User.all
        @lessons = Lesson.all
    end


    
end