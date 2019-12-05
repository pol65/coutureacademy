class CategoriesController < ApplicationController
    def show
        @lessons = Lesson.where(:category => params[:id]).all
    end
end
