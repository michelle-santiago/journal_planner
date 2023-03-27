require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @category = categories(:one)
    @category.user_id = @user.id
    @category.save
    @task = tasks(:one)
    @task.category_id = @category.id
    @task.save
   # user token for authorization
   cookies_helper(@user.token)
  end

  test "should get index" do
    get category_tasks_url(@category.id)
    assert_response :success
  end

  test "should get new" do
    get new_category_task_url(@category.id)
    assert_response :success
  end

  test "should create task" do
    assert_difference("Task.count") do
      post category_tasks_url(@category.id), params: { task: {title: @task.title, priority: @task.priority, status: @task.status, category_id: @task.category_id } }
    end
    assert_redirected_to category_tasks_url(@category.id)
  end

  test "should show task" do
    get category_tasks_url(@category.id)
    assert_response :success
  end

  test "should get edit" do
    get edit_category_task_url(@category.id, @task.id)
    assert_response :success
  end

  test "should update task" do
    patch category_task_url(@category.id, @task.id), params: { task: { title: @task.title, priority: @task.priority, status: @task.status, category_id: @task.category_id } }
    assert_redirected_to category_tasks_url(@category.id)
  end

  test "should destroy task" do
    assert_difference("Task.count", -1) do
      delete category_task_url(@category.id, @task.id)
    end

    assert_redirected_to category_tasks_url(@category.id)
  end
end