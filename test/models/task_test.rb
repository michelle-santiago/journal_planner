require "test_helper"

class TaskTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)

    @category = categories(:one)
    @category.user_id = @user.id
    @category.save

    @task = tasks(:one)
    @task.category_id = @category.id
    @task.save

    # for testing nil and empty 
    @task_empty = tasks(:three)
    @task_nil = tasks(:four)
  end 

 test "title can't be blank" do
    task = @task
    assert_not_empty(task.title)
  end

  test "title can't be nil" do
    task = @task
    assert_not_nil(task.title)
  end

  test "category id can't be blank" do
    task = @task
    assert_not_empty(task.category_id.to_s)
  end

  test "category id can't be nil" do
    task = @task
    assert_not_nil(task.category_id)
  end

  test "priority can't be blank" do
    task = @task
    assert_not_empty(task.priority)
  end

  test "priority can't be nil" do
    task = @task
    assert_not_nil(task.priority)
  end

  test "status can't be blank" do
    task = @task
    assert_not_empty(task.status)
  end

  test "status can't be nil" do
    task = @task
    assert_not_nil(task.status)
  end
end
