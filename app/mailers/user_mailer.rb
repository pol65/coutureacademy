class UserMailer < ApplicationMailer
    default from: 'coutureacademytoulouse@gmail.com'
   
    def welcome_email(user)
      @user = user 
      @url  = 'coutureacademy.herokuapp.com/users/sign_in' 
      mail(to: @user.email, subject: 'Bienvenue chez nous !') 
    end
  end
