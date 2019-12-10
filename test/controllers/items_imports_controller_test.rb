require 'test_helper'

class SinhViensImportsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get sinh_viens_imports_new_url
    assert_response :success
  end

  test "should get create" do
    get sinh_viens_imports_create_url
    assert_response :success
  end

  test "should get update" do
    get sinh_viens_imports_update_url
    assert_response :success
  end

end
