class CommentsController < ApplicationController
	def new # Méthode qui crée un COMMENTAIRE vide et l'envoie à une view new.html.erb (de comments) qui affiche le formulaire pour 'le remplir' (new.html.erb)
		@comment = Comment.new
	end

  def index
  end


  
def create
          @comment = Comment.new(content: comment_params[:content], lesson_id: comment_params[:id], user_id: current_user.id)
     puts "*" * 10
      puts "ceci est le contenu de params formulaire comments et signifie que le formulaire pointe bien sur create :"
      puts params
      puts "*" * 10



      if @comment.save
      	puts "$$$$$$$$$$$$$$$$$$"
      	puts "le comment a ete sauve"
      	puts "$$$$$$$$$$$$$$$$$$"
       flash[:success] = 'Le commentaire a ete cree avec succes'
        redirect_to(@comment.lesson)
        else

        	puts "@@@@@@@@@@@@"
        	puts "commentaire non sauvegarde"
        	puts "@@@@@@@@@@@"
        	 render "new"
      end


    end
  
private def comment_params
  params.require(:comment).permit(:content, :lesson_id)
end


end
