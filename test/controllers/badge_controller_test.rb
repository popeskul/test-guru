require "test_helper"

class BadgeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get badge_index_url
    assert_response :success
  end

  test "should get show" do
    get badge_show_url
    assert_response :success
  end

  test "should get new" do
    get badge_new_url
    assert_response :success
  end

  test "should get edit" do
    get badge_edit_url
    assert_response :success
  end

  test "should get create" do
    get badge_create_url
    assert_response :success
  end

  test "should get update" do
    get badge_update_url
    assert_response :success
  end

  test "should get destroy" do
    get badge_destroy_url
    assert_response :success
  end

  test "should get achievements" do
    get badge_achievements_url
    assert_response :success
  end

  test "should get set_badge" do
    get badge_set_badge_url
    assert_response :success
  end

  test "should get badge_params" do
    get badge_badge_params_url
    assert_response :success
  end
end
