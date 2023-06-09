class TasksController < ApplicationController
    before_action :get_category, :get_user

    def index
        @tasks = @category.tasks
        @categories = @user.categories
    end

    def show
        @task = @category.tasks.find(params["id"])
        @categories = @user.categories
    end
    
    def new
        @task = @category.tasks.build
    end

    def create
        @task = @category.tasks.build(task_params)
        if @task.save
            redirect_to category_tasks_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @task =  @category.tasks.find(params["id"])
    end
    
    def update
        @task = @category.tasks.find(params["id"])
        if @task.update(task_params)
            redirect_to category_tasks_path
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @task = @category.tasks.find(params["id"])
        @task.destroy
        redirect_to category_tasks_path
    end

    private

    def get_category
        @category = Category.find(params["category_id"])
    end

    def task_params
        params.require(:task).permit(:title,:description,:deadline,:category_id,:priority,:status)
    end

    def get_user
        @user = User.find_by_email(cookies.encrypted[:user_id])
    end
end
