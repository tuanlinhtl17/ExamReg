require 'test_helper'

class MonThisControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mon_this_index_url
    assert_response :success
  end

  test "should get show" do
    get mon_this_show_url
    assert_response :success
  end

end
