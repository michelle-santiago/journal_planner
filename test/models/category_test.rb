require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  def setup
    @category = Category.new(name: "Category 1", user_id: "1")
  end 

  test "name should not be blank" do
    @category.name = ""
    assert_not @category.valid? 
  end

  test "name should be unique" do
    @category.save
    @another_category =  Category.new(name: "category 1", user_id: "1")
    assert_not @another_category.save 
  end
  
  test "user_id should not be blank" do
    @category.user_id = ""
    assert_not @category.valid? 
  end

  test "should not save without name" do #passed as long as there's a validation of either name or user_id
    category = Category.new
    assert_not category.save
  end

  test "should not save without user_id" do #passed as long as there's a validation of either name or user_id
    category = Category.new
    assert_not category.save
  end


end
