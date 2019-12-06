class ApplicationController < ActionController::Base
<<<<<<< HEAD
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
  
    def configure_permitted_parameters
      added_attrs = [:username, :email, :password, :password_confirmation]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end
=======

    before_action :configure_devise_parameters, if: :devise_controller?

    def configure_devise_parameters
      devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:username, :description, :email, :password, :password_confirmation)}
      devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:username, :description, :email, :password, :password_confirmation)}
    end

>>>>>>> development
end
