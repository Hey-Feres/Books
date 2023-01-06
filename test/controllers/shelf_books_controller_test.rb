require 'test_helper'

class ShelfBooksControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get shelf_books_show_url
    assert_response :success
  end

  test "should get create" do
    get shelf_books_create_url
    assert_response :success
  end

end
