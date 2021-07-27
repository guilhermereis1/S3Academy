require "test_helper"

class DashboardStudent::CourseControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dashboard_student_course_index_url
    assert_response :success
  end
end
