require "test_helper"
require 'bcrypt'
class CategoriesControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:one)
    @category = categories(:one)
    @category.user_id = @user.id
    @category.save
    @category2 = categories(:two)
    @category2.user_id = @user.id
    
    # user token for authorization
    cookies_helper(@user.token)
  end                            

  test "should get index" do
    get categories_url
    assert_response :success
  end

  test "should get new" do
    get new_category_url
    assert_response :success
  end

  test "should create category" do
    assert_difference("Category.count") do
      post categories_url, params: { category: { name: @category2.name, user_id: @category2.user_id  } }
    end

    assert_redirected_to categories_url
  end

  test "should show category" do
    get category_url(@category)
    assert_response :success
  end

  test "should get edit" do
    get edit_category_url(@category)
    assert_response :success
  end

  test "should update category" do
    patch category_url(@category), params: { category: { name: @category.name, user_id: @category.user_id  } }
    assert_redirected_to categories_url
  end

  test "should destroy category" do
    assert_difference("Category.count", -1) do
      delete category_url(@category)
    end

    assert_redirected_to categories_url
  end

end
