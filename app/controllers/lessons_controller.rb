class LessonsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :create]

  def index
    @lessons = Lesson.all
    @users = User.all
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(
      title: params[:lesson][:title], 
      content: params[:lesson][:content],
      teacher: current_user)
    if @lesson.save 
      flash[:success] = "Votre cours est en ligne !"
      redirect_to root_path
      puts "#"*10
      puts params
      puts "#"*10
     else
      render "new"
    end
  end
end
