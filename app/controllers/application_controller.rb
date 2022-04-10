class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :null_session

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = JsonWebToken.decode(header)
      @current_student = Student.find(@decoded[:student_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end

  def refresh_token    
    begin
      @decoded = JsonWebToken.decode(params[:token])
      @current_student = Student.find(@decoded[:student_id])
      render json: @current_student
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message, error: true }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message, error: true }, status: :unauthorized
    end    
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :avatar, :password, :password_confirmation, :current_password])
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :avatar, :password, :password_confirmation, :current_password) }
  end
end
