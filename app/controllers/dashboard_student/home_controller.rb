class DashboardStudent::HomeController < ApplicationController
  before_action :authenticate_student!
  layout 'student'

  def index
    @courses = Subscription.where(student_id: current_student.id)
  end
end
