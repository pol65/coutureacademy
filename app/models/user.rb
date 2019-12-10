class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
            :recoverable, :rememberable, :validatable
    devise :omniauthable, omniauth_providers: [:facebook]
            
has_one_attached :avatar

has_many  :classrooms
has_many  :lessons, through: :classrooms

has_many :followed_lessons, foreign_key: "student_id", class_name: "Lesson"
has_many :taught_lessons,  foreign_key: "teacher_id", class_name: "Lesson"


  def self.from_facebook(auth)
    where(facebook_id: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.username = auth.info.name 
      user.password = Devise.friendly_token[0, 20]
      user.skip_confirmation!
    end
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where("lower(username) = :value", value: login.downcase).first
    else
      where(conditions.to_hash).first
    end
  end

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
