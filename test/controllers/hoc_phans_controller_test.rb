require 'test_helper'

class HocPhansControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get hoc_phans_new_url
    assert_response :success
  end

  test "should get create" do
    get hoc_phans_create_url
    assert_response :success
  end

  test "should get update" do
    get hoc_phans_update_url
    assert_response :success
  end

  test "should get edit" do
    get hoc_phans_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get hoc_phans_destroy_url
    assert_response :success
  end

  test "should get index" do
    get hoc_phans_index_url
    assert_response :success
  end

end
