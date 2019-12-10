class Admin::LessonsController < ApplicationController
    before_action :authenticate_user!

    def index
        @users = User.all
        @lessons = Lesson.all
    end


    
end