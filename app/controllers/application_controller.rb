class ApplicationController < ActionController::Base
<<<<<<< HEAD
    def is_admin?
        if current_user.admin?
        else
            redirect_to root_path
            flash[:danger] = "Not an admin"
        end
=======
  include ApplicationHelper

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
  
    def configure_permitted_parameters
      added_attrs = [:username, :description, :email, :password, :password_confirmation]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
>>>>>>> 08aaaf3a298630ebe43ccc994aa8eefc58e483eb
    end
end
