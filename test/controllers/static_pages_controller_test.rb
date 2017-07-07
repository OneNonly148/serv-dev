require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get booking" do
    get static_pages_booking_url
    assert_response :success
  end

end
