require "test_helper"

class DashboardUser::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dashboard_user_users_index_url
    assert_response :success
  end

  test "should get show" do
    get dashboard_user_users_show_url
    assert_response :success
  end
end
