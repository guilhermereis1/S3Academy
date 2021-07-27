require "test_helper"

class DashboardStudent::HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dashboard_student_home_index_url
    assert_response :success
  end
end
