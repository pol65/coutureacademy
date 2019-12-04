class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many  :classrooms
  has_many  :lessons, through: :classrooms

  has_many :followed_lessons, foreign_key: "student_id", class_name: "Lesson"
  has_many :taught_lessons,  foreign_key: "teacher_id", class_name: "Lesson"



  class Student < User
    
   
  end 

  class Teacher < User
     
    
  end

end 
