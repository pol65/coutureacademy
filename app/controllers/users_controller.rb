class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

  end


  def new

        # Méthode qui crée un user vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)

    @user = User.new
  end


end
