class Admin::UsersController < ApplicationController
    before_action :authenticate_user!, :is_admin?
    
    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
    end
    
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        if @user.destroy 
          flash[:warning] = "Le compte a bien été supprimé !"
          redirect_to root_path
        else
          render "new"
        end
    end   
end