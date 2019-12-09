class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
            :recoverable, :rememberable, :validatable


has_many  :classrooms
has_many  :lessons, through: :classrooms

has_many :followed_lessons, foreign_key: "student_id", class_name: "Lesson"
has_many :taught_lessons,  foreign_key: "teacher_id", class_name: "Lesson"

has_many :comments


  def is_teacher? 
    if @current_user.taught_lessons.count > 0
    else
    end
  end
  
  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
