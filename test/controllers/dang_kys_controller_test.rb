require 'test_helper'

class DangKysControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dang_kys_index_url
    assert_response :success
  end

  test "should get create" do
    get dang_kys_create_url
    assert_response :success
  end

  test "should get update" do
    get dang_kys_update_url
    assert_response :success
  end

  test "should get destroy" do
    get dang_kys_destroy_url
    assert_response :success
  end

  test "should get print" do
    get dang_kys_print_url
    assert_response :success
  end

end
