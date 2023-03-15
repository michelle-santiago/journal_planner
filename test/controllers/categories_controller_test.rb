require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "should get index" do
    get categories_url #categories_index_url //no alias
    assert_response :success
  end

  test "should get new" do
    get categories_new_url
    assert_response :success
  end
end
