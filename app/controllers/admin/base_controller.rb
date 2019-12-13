class Admin::BaseController < ApplicationController
    before_action :authenticate_user!, :is_admin?

    def index
        @user = current_user
    end
end

