require 'test_helper'

class CateresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cateres_index_url
    assert_response :success
  end

end
