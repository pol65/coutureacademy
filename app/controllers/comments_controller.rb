class CommentsController < ApplicationController
	def new # Méthode qui crée un COMMENTAIRE vide et l'envoie à une view new.html.erb (de comments) qui affiche le formulaire pour 'le remplir' (new.html.erb)
		@comment = Comment.new
	end


def create


     # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
     # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
    


      @comment = Comment.new(content: params[:content], lesson_id: params[:lesson_id])
     # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)
	#on verifie que le formulaire envoie bien les params saisis code entre les puts $ non necessaire , mais qui nous permet de checker au debut 
   	  puts "*" * 10
   	  puts "ceci est le contenu de params formulaire comments et signifie que le formulaire pointe bien sur create :"
      puts params
      puts "*" * 10
   	 #OK ca envoie bien ici 

      if @comment.save
      	puts "$$$$$$$$$$$$$$$$$$"
      	puts "le comment a ete sauve"
      	puts "$$$$$$$$$$$$$$$$$$"
       flash[:success] = 'Le commentaire a ete cree avec succes'
        redirect_to(@comment.lesson)
        else

        	puts "@@@@@@@@@@@@"
        	puts "commentaire pas sauvegarde"
        	puts "@@@@@@@@@@@"
        	 #redirect_to lesson_path
      end


    end
  



end
