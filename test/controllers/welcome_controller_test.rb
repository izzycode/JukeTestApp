require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get izzy_bam" do
    get welcome_izzy_bam_url
    assert_response :success
  end

end
