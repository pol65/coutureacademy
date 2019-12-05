class LessonsController < ApplicationController
  def index
    @lessons = Lesson.all
    @users = User.all
  end

  def show
    @lesson = Lesson.find(params[:id])
  end
end