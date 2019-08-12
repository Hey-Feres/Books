require 'test_helper'

class ResenhaControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get resenha_new_url
    assert_response :success
  end

  test "should get edit" do
    get resenha_edit_url
    assert_response :success
  end

  test "should get show" do
    get resenha_show_url
    assert_response :success
  end

end
