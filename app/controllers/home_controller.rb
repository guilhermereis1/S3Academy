class HomeController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:course_id])
    @sections = Section.where(course_id: @course.id)
  end
end
