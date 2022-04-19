class DashboardStudent::NotificationsController < ApplicationController
  before_action :authorize_request
  
  def index
    @notifications = Notification.all.order(created_at: :desc)
  end
end
