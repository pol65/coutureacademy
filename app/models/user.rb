class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
            :recoverable, :rememberable, :validatable,
            :omniauthable 

validates :username, presence: true, length: {maximum: 25}

has_many  :classrooms
has_many  :lessons, through: :classrooms

has_many :followed_lessons, foreign_key: "student_id", class_name: "Lesson"
has_many :taught_lessons,  foreign_key: "teacher_id", class_name: "Lesson"


  def is_teacher? 
    if @current_user.taught_lessons.count > 0
    else
    end
  end
  
  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil) #en utilsant self pas besoin de passer par la creation d une instance de user avec @user =User.find_by(google_omiauth blablabla)
    data = access_token.info #on va recuperer l information de l access token , l acces_token dans les parametres sera retourne dans l argument  par google
    user = User.where(:provider => access_token.provider, :uid => access_token.uid).first 

    if user #on cherche si user , on retourne user, cela veut dire qu il existe deja dans notre BDD sinon si user et pas du social account , on va creer le registered_user et on 
      return user
    else 
      registered_user = User.where(:email => access_token.email).first
      if registered_user
        return registered_user
      else
        user = User.create(
        username: data["username"],
        provider: access_token.provider,
        email: data["email"],
        uid: access_token.uid,
        password: Devise.friendly_token[0,20]
        )
      end
    end
  end
end
