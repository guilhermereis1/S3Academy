class DashboardStudent::NotificationsController < ApplicationController
  before_action :authenticate_student!
  layout 'student'
  
  def index
    @notifications = Notification.all.order(created_at: :desc)
  end
end
