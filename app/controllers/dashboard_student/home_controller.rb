class DashboardStudent::HomeController < ApplicationController
  before_action :authorize_request

  def index
    @subscriptions = Subscription.where(student_id: params[:student_id])
    render json: @subscriptions, adapter: :json, each_serializer: SubscriptionSerializer
  end
end
