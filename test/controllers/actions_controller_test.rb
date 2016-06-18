require 'test_helper'

class ActionsControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get actions_search_url
    assert_response :success
  end

  test "should get playlist" do
    get actions_playlist_url
    assert_response :success
  end

  test "should get social_image" do
    get actions_social_image_url
    assert_response :success
  end

end
