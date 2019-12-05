class LessonController < ApplicationController
  def index
    @lessons = Lesson.all
    @users = User.all
  end

  def show
  	@comment = Comment.new
  	@comments = Comment.all #nous avons besoin des comments pour les afficher dans le show gossis!!!
	
    @lesson = Lesson.find(params[:id])
  end
  	
 def create


     # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
     # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
    


      @comment = Comment.new(content: params[:content], user: User.find_by(id: session[:user_id]), lesson_id: params[:lesson_id])
     # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)
	#on verifie que le formulaire envoie bien les params saisis code entre les puts $ non necessaire , mais qui nous permet de checker au debut 
   	  puts "*" * 10
   	  puts "ceci est le contenu de params formulaire comments et signifie que le formulaire pointe bien sur create :"
      puts params
      puts "*" * 10
   	 #OK ca envoie bien ici 

      if @comment.save
       flash[:success] = 'Le commentaire a ete cree avec succes'
        redirect_to(@comment.lesson)
        else
          redirect_to lesson_path
      end


    end
  

  
end
