require "test_helper"

class DashboardStudent::NotificationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dashboard_student_notifications_index_url
    assert_response :success
  end
end
