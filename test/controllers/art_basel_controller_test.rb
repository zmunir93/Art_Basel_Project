require 'test_helper'

class ArtBaselControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get art_basel_index_url
    assert_response :success
  end

end
