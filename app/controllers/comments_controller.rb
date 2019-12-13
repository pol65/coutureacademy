class CommentsController < ApplicationController
	def new 
		@comment = Comment.new
	end

  def index
  end
  
  def create
    @comment = Comment.new(comment_params)
    @comment.lesson = Lesson.find(params[:lesson_id])
    @comment.user = current_user
    if @comment.save
      flash[:success] = 'Le commentaire a ete cree avec succes'
      redirect_to(@comment.lesson)
    else
      render "new"
    end
  end

private 
  def comment_params
    params.require(:comment).permit(:content, :lesson_id)
  end
end
