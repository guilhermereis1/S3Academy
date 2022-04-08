class HomeController < ApplicationController
  def index
    @courses = Course.where(status: 'inactive')
  end

  def show
    @course = Course.find_by(status: 'inactive', id: params[:course_id])
  end
end
