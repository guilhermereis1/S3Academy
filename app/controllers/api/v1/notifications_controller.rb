module Api
  module V1
    class NotificationsController < ApplicationController
      before_action :set_notification, only: %i[ show ]
    
      # GET /api/v1/notifications or /notifications.json
      def index
        @notifications = Notification.all
    
        render json: @notifications#, each_serializer: CoursesSerializer
      end

      def show
        render json: @notification#, serializer: CourseSerializer
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_notification
        @notification = Notification.find(params[:id])
      end
    end
  end
end