class DashboardStudent::HomeController < ApplicationController
  before_action :authenticate_student!
  layout 'student'

  def index
    @courses = Course.all
  end
end
