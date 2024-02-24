require "test_helper"

class ProgressionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get progression_index_url
    assert_response :success
  end
end
