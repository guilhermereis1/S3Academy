class HomeController < ApplicationController
  def index
    @courses = Course.where(status: 'inactive')
  end

  def show
    @course = Course.friendly.find_by(params[:slug])
  end
end
