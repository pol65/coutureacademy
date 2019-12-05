class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
<<<<<<< HEAD
=======
  
>>>>>>> development
  end
end
