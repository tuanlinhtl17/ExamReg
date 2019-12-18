require 'test_helper'

class CaThisControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get ca_this_show_url
    assert_response :success
  end

end
