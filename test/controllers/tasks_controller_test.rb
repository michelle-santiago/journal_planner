require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  def setup
    @category = Category.new(name: "Category 1", user_id: "1")
    @category.save
    @task = Task.new(title: "Task 1", priority: "High", status: "Not Started", category_id: @category.id)
    @task.save

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