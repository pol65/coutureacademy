class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end


  def new

        # Méthode qui crée un user vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)

    @user = User.new
  end
=begin
  def create
    # Méthode qui créé un user à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
    # Une fois la création faite, on redirige ici vers la méthode index ici de gossips pour afficher tous les gossips (pour afficher le potin créé)



    #CQFD
    #city = City.find_or_create_by(name: params[:city], zip_code: params[:zip_code])
    #@user = User.new(first_name: params[:first_name], last_name: params[:last_name], city: city, description: params[:description], age: params[:age], email: params[:email], password: params[:password], city_id: City.last.id) 
    @user = User.new(email: params[:email], password: params[:password], username: params[:username])    
    if @user.save
      flash[:success] = 'Le profil a ete cree avec succes!'
      redirect_to lessons_path 
    else
      render :new
    end
  end
=end
end
