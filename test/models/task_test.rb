require "test_helper"

class TaskTest < ActiveSupport::TestCase
  def setup
    @task = Task.new(title: "Task 1", category_id: "1", priority: "High", status: "Not started")
  end 

  test "title should not be blank" do
    @task.title = ""
    assert_not @task.valid? 
  end

  test "category_id should not be blank" do
    @task.category_id = ""
    assert_not @task.valid? 
  end

  test "priority should not be blank" do
    @task.priority = ""
    assert_not @task.valid? 
  end

  test "status should not be blank" do
    @task.status = ""
    assert_not @task.valid? 
  end

end
