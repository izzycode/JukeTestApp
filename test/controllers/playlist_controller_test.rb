require 'test_helper'

class PlaylistControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get playlist_create_url
    assert_response :success
  end

  test "should get destroy" do
    get playlist_destroy_url
    assert_response :success
  end

end
