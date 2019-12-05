class ApplicationController < ActionController::Base
    def is_admin?
        if current_user.admin?
        else
            redirect_to root_path
            flash[:danger] = "Not an admin"
        end
    end
end
