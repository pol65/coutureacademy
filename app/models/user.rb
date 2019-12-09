class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
            :recoverable, :rememberable, :validatable


has_many  :classrooms
has_many  :lessons, through: :classrooms

has_many :followed_lessons, foreign_key: "student_id", class_name: "Lesson"
has_many :taught_lessons,  foreign_key: "teacher_id", class_name: "Lesson"


<<<<<<< HEAD
def is_teacher? 
  if @current_user.taught_lessons.count > 0
  else
  end
end
=======
  def is_teacher? 
    if @current_user.taught_lessons.count > 0
    else
    end
  end
>>>>>>> 08aaaf3a298630ebe43ccc994aa8eefc58e483eb
  
  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

end
