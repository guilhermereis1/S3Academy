class AuthenticationController < ApplicationController
  before_action :authorize_request, except: :login

  # POST /auth/login
  def login
    @student = Student.find_by_email(params[:email])
    
    if @student.valid_password?(params[:password])
      token = JsonWebToken.encode(student_id: @student.id)
      render json: { id: @student.id, token: token, email: @student.email }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end