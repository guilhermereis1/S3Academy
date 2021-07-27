class DashboardStudent::CourseController < ApplicationController
  before_action :authenticate_student!
  layout 'student'

  def index
    @course = Course.find(params[:course_id].to_i)
  end
end
