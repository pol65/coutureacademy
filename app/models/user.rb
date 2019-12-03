class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


has_many  :classrooms
has_many  :lessons, through: :classrooms

has_many :taught_lessons,  foreign_key: "teacher_id", class_name: "Lesson"



class Teacher < User 

end








end
