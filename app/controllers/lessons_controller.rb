class LessonsController < ApplicationController

  before_action :authenticate_user!, only: [:new]


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
      category: params[:lesson][:category],
      teacher: current_user)
    if @lesson.save 
      flash[:success] = "Votre cours est en ligne !"
      redirect_to root_path
    else
      render "new"
    end
  end



  def destroy
    @lesson = Lesson.find(params[:id])
    Lesson.destroy(@lesson.id)
    if @lesson.destroy 
      flash[:warning] = "Votre cours a bien été supprimé !"
      redirect_to root_path
    else
      render "new"
    end
  end


  
end
