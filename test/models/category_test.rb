require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
    
    @category = categories(:one)
    @category.user_id = @user.id
    @category.save
    # for testing nil and empty 
    @category_empty = categories(:three)
    @category_nil = categories(:four)
  end 

  test "name can't be blank" do
    category  = @category
    assert_not_empty(category.name)
  end

  test "name can't be nil" do
    category  = @category
    assert_not_nil(category.name)
  end

  test "name should be unique" do
    @another_category =  Category.new(name: @category.name, user_id: @category.user_id)
    assert_not @another_category.save 
  end
  
  test "user id can't be blank" do
    category  = @category
    assert_not_empty(category.user_id.to_s)
  end

  test "user id can't be nil" do
    category  = @category
    assert_not_nil(category.user_id)
  end

end
