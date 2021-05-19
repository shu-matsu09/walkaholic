require 'test_helper'

class PedometersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pedometers_index_url
    assert_response :success
  end

  test "should get new" do
    get pedometers_new_url
    assert_response :success
  end

end
