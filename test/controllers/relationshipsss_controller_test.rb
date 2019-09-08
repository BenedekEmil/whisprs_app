require 'test_helper'

class RelationshipsssControllerTest < ActionDispatch::IntegrationTest
  test "should get follow_user" do
    get relationshipsss_follow_user_url
    assert_response :success
  end

  test "should get unfollow_user" do
    get relationshipsss_unfollow_user_url
    assert_response :success
  end

end
