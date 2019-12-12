class CategoriesController < ApplicationController
    def show
        @lessons = Lesson.where(:category => params[:id], :checked => true).all
    end

    
end
