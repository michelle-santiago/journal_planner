class CategoriesController < ApplicationController
    before_action :get_user

    def index
        @categories = @user.categories
    end

    def new
        @category = @user.categories.build
    end

    def create
        @category = @user.categories.build(category_params)

        if @category.save
            redirect_to categories_path
        else 
            render :new, status: :unprocessable_entity
        end

    end

    def edit
        @category = @user.categories.find(params["id"])
    end
    
    def update
        @category = @user.categories.find(params["id"])
        if @category.update(category_params)
            redirect_to categories_path
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @category = @user.categories.find(params["id"])
        @category.destroy
        redirect_to categories_path
    end

    def show
        @category = @user.categories.find(params["id"])
    end

    private
    def get_user
        # @user = User.find(params["user_id"])
        @user = User.find_by_email(cookies.encrypted[:user_id])
    end

    def category_params
        params.require(:category).permit(:name,:user_id)
    end
end
