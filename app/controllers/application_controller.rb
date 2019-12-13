class ApplicationController < ActionController::Base
  include ApplicationHelper
  include LessonHelper

  before_action :configure_permitted_parameters, if: :devise_controller? 
  
  protected
  
    def configure_permitted_parameters
      added_attrs = [:username, :description, :email, :password, :password_confirmation]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end
  
    def is_admin?
        if current_user.admin?
        else
            redirect_to root_path
            flash[:danger] = "Vous n'êtes pas administrateur."
        end
    end
end
