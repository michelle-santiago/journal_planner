class HomeController < ApplicationController
    before_action :get_user
    
    def index
        @categories = @user.categories
    end

    private
    def get_user
        @user = User.find_by_email(cookies.encrypted[:user_id])
    end

end
