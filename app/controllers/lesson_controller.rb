class LessonController < ApplicationController
  before_action :authenticate_user!, only: [:show, :create]

  def index
    @lessons = Lesson.all
    @users = User.all
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  def new
  end

  def create
    @lesson = Lesson.create(
      title: params[:lesson_title], 
      content: params[:lesson_content]) 
    if @lesson.save 
      flash[:success] = "Votre cours est en ligne !"
      redirect_to root_path
      puts "#"*10
      puts "it worked"
      puts "#"*10
     else
      render "new"
      puts "#"*10
      puts @lesson.errors
      puts "#"*10
    end
  end
end
