require 'test_helper'

class WhisprsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @whispr = whisprs(:one)
  end

  test "should get index" do
    get whisprs_url
    assert_response :success
  end

  test "should get new" do
    get new_whispr_url
    assert_response :success
  end

  test "should create whispr" do
    assert_difference('Whispr.count') do
      post whisprs_url, params: { whispr: { description: @whispr.description, title: @whispr.title, user_id: @whispr.user_id } }
    end

    assert_redirected_to whispr_url(Whispr.last)
  end

  test "should show whispr" do
    get whispr_url(@whispr)
    assert_response :success
  end

  test "should get edit" do
    get edit_whispr_url(@whispr)
    assert_response :success
  end

  test "should update whispr" do
    patch whispr_url(@whispr), params: { whispr: { description: @whispr.description, title: @whispr.title, user_id: @whispr.user_id } }
    assert_redirected_to whispr_url(@whispr)
  end

  test "should destroy whispr" do
    assert_difference('Whispr.count', -1) do
      delete whispr_url(@whispr)
    end

    assert_redirected_to whisprs_url
  end
end
