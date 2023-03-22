require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest

  def setup
     @category = Category.new(name: "Category 1", user_id: "1")
     @category.save
     #categories(:one) => <Category id: 980190962, name: nil, user_id: nil, created_at: "2023-03-16 04:39:38.080706000 +0000", updated_at: "2023-03-16 04:39:38.080706000 +0000"
                          # does not work for (create,update )because of validation in model
  end

  test "should get index" do
    get categories_url
    assert_response :success
  end

  test "should get new" do
    get new_category_url
    assert_response :success
  end
  #fail
  test "should create category" do
    assert_difference("Category.count") do
      post categories_url, params: { category: { name: @category.name, user_id: @category.user_id  } }
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
